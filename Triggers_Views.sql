-- Views
-- 1.
CREATE VIEW v_equipment_stock AS
SELECT E.EQ_NAME, E.BRAND, E.MODEL, I.QUANTITY
FROM EQUIPMENTS E
JOIN INVENTORY I ON E.EQ_ID = I.EQ_ID;


CREATE VIEW v_total_sales_by_equipment AS
SELECT E.EQ_NAME, E.BRAND, E.MODEL, SUM(ID.QUANTITY) AS TOTAL_QUANTITY_SOLD,
       SUM(ID.QUANTITY * ID.UNIT_PRICE) AS TOTAL_SALES_VALUE
FROM EQUIPMENTS E
JOIN INVOICE_DETAILS ID ON E.EQ_ID = ID.EQ_ID
GROUP BY E.EQ_NAME, E.BRAND, E.MODEL;


-- 2.
CREATE VIEW v_total_purchases_by_equipment AS
SELECT E.EQ_NAME, E.BRAND, E.MODEL, SUM(PD.QUANTITY) AS TOTAL_QUANTITY_PURCHASED,
       SUM(PD.QUANTITY * PD.UNIT_COST) AS TOTAL_PURCHASE_COST
FROM EQUIPMENTS E
JOIN PURCHASE_DETAILS PD ON E.EQ_ID = PD.EQ_ID
GROUP BY E.EQ_NAME, E.BRAND, E.MODEL;


-- 3.
CREATE VIEW v_customer_purchase_history AS
SELECT C.CUSTOMER_NAME, C.CUSTOMER_EMAIL, I.INVOICE_ID, ID.QUANTITY, ID.UNIT_PRICE,
       ID.QUANTITY * ID.UNIT_PRICE AS TOTAL_COST, I.QUOTATION_ID
FROM CUSTOMERS C
JOIN INVOICES I ON C.CUSTOMER_ID = I.CUSTOMER_ID
JOIN INVOICE_DETAILS ID ON I.INVOICE_ID = ID.INVOICE_ID;

--4.
CREATE VIEW v_pending_quotations AS
SELECT Q.QUOTATION_ID, C.COMPANY_NAME, S.SUPPLIER_NAME, E.EMPLOYEE_NAME, Q.TOTAL
FROM QUOTATIONS Q
JOIN COMPANIES C ON Q.COMPANY_ID = C.COMPANY_ID
JOIN SUPPLIERS S ON Q.SUPPLIER_ID = S.SUPPLIER_ID
JOIN EMPLOYEES E ON Q.EMPLOYEE_ID = E.EMPLOYEE_ID
WHERE Q.STATE = 'Pending';


--5. 
CREATE VIEW v_suppliers_total_purchases AS
SELECT S.SUPPLIER_NAME, SUM(PD.QUANTITY * PD.UNIT_COST) AS TOTAL_PURCHASE_VALUE
FROM SUPPLIERS S
JOIN PURCHASES P ON S.SUPPLIER_ID = P.SUPPLIER_ID
JOIN PURCHASE_DETAILS PD ON P.PURCHASE_ID = PD.PURCHASE_ID
GROUP BY S.SUPPLIER_NAME;

--6.
CREATE VIEW v_employee_sales AS
SELECT E.EMPLOYEE_NAME, SUM(ID.QUANTITY * ID.UNIT_PRICE) AS TOTAL_SALES_VALUE
FROM EMPLOYEES E
JOIN INVOICES I ON E.EMPLOYEE_ID = I.EMPLOYEE_ID
JOIN INVOICE_DETAILS ID ON I.INVOICE_ID = ID.INVOICE_ID
GROUP BY E.EMPLOYEE_NAME;


--7. 
CREATE VIEW v_equipment_categories_stock AS
SELECT C.CATEGORY_NAME, SUM(I.QUANTITY) AS TOTAL_QUANTITY
FROM CATEGORIES C
JOIN EQUIPMENTS E ON C.CATEGORY_ID = E.CATEGORY_ID
JOIN INVENTORY I ON E.EQ_ID = I.EQ_ID
GROUP BY C.CATEGORY_NAME;




-- 8. View: Current Inventory with Equipment Details
CREATE OR REPLACE VIEW vw_inventory_status AS
SELECT i.inventory_id,
       e.eq_id,
       e.eq_name,
       e.brand,
       e.model,
       i.quantity,
       i.location,
       i.last_update
FROM inventory i
JOIN equipments e ON i.eq_id = e.eq_id;

-- 9. View: Purchases with Supplier and Equipment
CREATE OR REPLACE VIEW vw_purchase_details AS
SELECT p.purchase_id,
       s.supplier_name,
       e.eq_name,
       pd.quantity,
       pd.unit_cost,
       pd.total
FROM purchases p
JOIN suppliers s ON p.supplier_id = s.supplier_id
JOIN purchase_details pd ON p.purchase_id = pd.purchase_id
JOIN equipments e ON pd.eq_id = e.eq_id;

-- 10. View: Invoices with Customer and Equipment
CREATE OR REPLACE VIEW vw_invoice_details AS
SELECT i.invoice_id,
       c.customer_name,
       e.eq_name,
       id.quantity,
       id.unit_price,
       (id.quantity * id.unit_price) AS total_amount
FROM invoices i
JOIN customers c ON i.customer_id = c.customer_id
JOIN invoice_details id ON i.invoice_id = id.invoice_id
JOIN equipments e ON id.eq_id = e.eq_id;

-- 11. View: Supplier Inventory Contribution
CREATE OR REPLACE VIEW vw_supplier_inventory AS
SELECT s.supplier_name,
       e.eq_name,
       SUM(pd.quantity) AS total_supplied
FROM suppliers s
JOIN purchases p ON s.supplier_id = p.supplier_id
JOIN purchase_details pd ON p.purchase_id = pd.purchase_id
JOIN equipments e ON pd.eq_id = e.eq_id
GROUP BY s.supplier_name, e.eq_name;

-- 12. View: Customer Purchase History
CREATE OR REPLACE VIEW vw_customer_history AS
SELECT c.customer_name,
       e.eq_name,
       id.quantity,
       id.unit_price,
       (id.quantity * id.unit_price) AS total_spent,
       i.invoice_id
FROM customers c
JOIN invoices i ON c.customer_id = i.customer_id
JOIN invoice_details id ON i.invoice_id = id.invoice_id
JOIN equipments e ON id.eq_id = e.eq_id;








select * from cat;

-- Trigger 1: Increment inventory when purchase_details is inserted
CREATE OR REPLACE TRIGGER trg_inventory_increment
AFTER INSERT ON purchase_details
FOR EACH ROW
BEGIN
  UPDATE inventory
  SET quantity = quantity + :NEW.quantity,
      last_update = SYSTIMESTAMP
  WHERE eq_id = :NEW.eq_id;

  -- If equipment not in inventory yet, insert it
  IF SQL%ROWCOUNT = 0 THEN
    INSERT INTO inventory (inventory_id, eq_id, quantity, last_update, location)
    VALUES (INV_ID_INV_TABLE.nextval, :NEW.eq_id, :NEW.quantity, SYSTIMESTAMP, 'Warehouse');
  END IF;
END;
/

-- Trigger 2: Decrement inventory when invoice_details is inserted
CREATE OR REPLACE TRIGGER trg_inventory_decrement
AFTER INSERT ON invoice_details
FOR EACH ROW
BEGIN
  UPDATE inventory
  SET quantity = quantity - :NEW.quantity,
      last_update = SYSTIMESTAMP
  WHERE eq_id = :NEW.eq_id;
END;
/

-- Trigger 3: Rollback inventory if purchase_details is deleted
CREATE OR REPLACE TRIGGER trg_inventory_purchase_delete
AFTER DELETE ON purchase_details
FOR EACH ROW
BEGIN
  UPDATE inventory
  SET quantity = quantity - :OLD.quantity,
      last_update = SYSTIMESTAMP
  WHERE eq_id = :OLD.eq_id;
END;
/

-- Trigger 4: Rollback inventory if invoice_details is deleted
CREATE OR REPLACE TRIGGER trg_inventory_invoice_delete
AFTER DELETE ON invoice_details
FOR EACH ROW
BEGIN
  UPDATE inventory
  SET quantity = quantity + :OLD.quantity,
      last_update = SYSTIMESTAMP
  WHERE eq_id = :OLD.eq_id;
END;
/

-- Trigger 5: Adjust inventory if purchase_details is updated
CREATE OR REPLACE TRIGGER trg_inventory_purchase_update
AFTER UPDATE ON purchase_details
FOR EACH ROW
BEGIN
  UPDATE inventory
  SET quantity = quantity + (:NEW.quantity - :OLD.quantity),
      last_update = SYSTIMESTAMP
  WHERE eq_id = :NEW.eq_id;
END;
/

COMMIT;