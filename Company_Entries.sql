

select * from companies;
insert into companies values (COMP_ID_COMP_TABLE.nextval, 'General Machines', 'Manufacturing', '0799452154', 'Kabul, Afghanistan', SYSDATE);


CREATE TABLE COMPANIES(
    COMPANY_ID INT DEFAULT COMP_ID_COMP_TABLE.NEXTVAL PRIMARY KEY,
    COMPANY_NAME VARCHAR(100) NOT NULL,
    COMPANY_TYPE VARCHAR(20) DEFAULT 'Manufacturing' CHECK(COMPANY_TYPE IN('Manufacturing', 'Industrial', 'Third Party')),
    COMPANY_CONTACT VARCHAR(15) NOT NULL UNIQUE,
    COMPANY_ADDRESS VARCHAR(100) NOT NULL,
    CREATED_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'General Machines Ltd', 'Manufacturing', '0799123456', 'Kabul, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Afghan Steel Works', 'Industrial', '0786554412', 'Herat, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Eastern Logistics Co', 'Third Party', '03018852347', 'Peshawar, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Mountain Engineering', 'Manufacturing', '0798445122', 'Mazar-e-Sharif, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Pak Tech Supplies', 'Industrial', '03125578421', 'Islamabad, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Kandahar Heavy Tools', 'Manufacturing', '0789122344', 'Kandahar, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Nangarhar Parts Distribution', 'Third Party', '0797448891', 'Jalalabad, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Universal Mechanics Co', 'Industrial', '03054411229', 'Lahore, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Bamyan Construction Materials', 'Manufacturing', '0778445621', 'Bamyan, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Frontier Industrial Solutions', 'Industrial', '03348855211', 'Quetta, Pakistan', SYSDATE);

INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Helmand Machinery Corp', 'Manufacturing', '0785223366', 'Helmand, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Ghazni Auto Components', 'Third Party', '0799664521', 'Ghazni, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Rawalpindi Engines Ltd', 'Industrial', '03225518847', 'Rawalpindi, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Kunar Parts & Tools', 'Manufacturing', '0782331544', 'Kunar, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Balochistan Metal Works', 'Industrial', '03458877452', 'Quetta, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Faryab Distribution Co', 'Third Party', '0797556644', 'Faryab, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Samangan Equipment Ltd', 'Manufacturing', '0784452109', 'Samangan, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Punjab Tech Traders', 'Third Party', '03054881220', 'Multan, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'North Engineering Group', 'Industrial', '03119985211', 'Sialkot, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Wardak Machine Services', 'Manufacturing', '0796332214', 'Maidan Wardak, Afghanistan', SYSDATE);

INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Kabul Machinery Traders', 'Manufacturing', '0799332154', 'Kabul, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Herat Industrial Group', 'Industrial', '0785224477', 'Herat, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Pak-Afghan Logistics Co', 'Third Party', '03145523981', 'Peshawar, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Ghor Engineering Works', 'Manufacturing', '0778441254', 'Ghor, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Sindh Steel Supplies', 'Industrial', '03452219472', 'Karachi, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Afghan Auto Industries', 'Manufacturing', '0799441258', 'Kandahar, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Central Asia Transport Co', 'Third Party', '03225599147', 'Islamabad, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Takhar Mechanical Services', 'Manufacturing', '0784112359', 'Takhar, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Punjab Engineering Hub', 'Industrial', '03347781549', 'Lahore, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Nimroz Parts Exporters', 'Third Party', '0797556642', 'Nimroz, Afghanistan', SYSDATE);

INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Khost Machinery Depot', 'Manufacturing', '0785443321', 'Khost, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Superior Steel Products', 'Industrial', '03054479211', 'Rawalpindi, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Eastern Border Transport', 'Third Party', '03128874410', 'Torkham, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Balkh Assembly Systems', 'Manufacturing', '0798445210', 'Balkh, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Quetta Iron & Metal Works', 'Industrial', '03458871239', 'Quetta, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Uruzgan Supply & Distribution', 'Third Party', '0789664451', 'Uruzgan, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Badakhshan Machine Tools', 'Manufacturing', '0794557122', 'Badakhshan, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Hyderabad Industrial Traders', 'Industrial', '03221158472', 'Hyderabad, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Nuristan Transport Solutions', 'Third Party', '0789445781', 'Nuristan, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Logar Manufacturing Co', 'Manufacturing', '0794785123', 'Logar, Afghanistan', SYSDATE);

INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Sialkot Engineering Hub', 'Industrial', '03129987411', 'Sialkot, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Helmand Logistics Services', 'Third Party', '0785229833', 'Helmand, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Samangan Mechanical Works', 'Manufacturing', '0796554128', 'Samangan, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Karachi Heavy Industries', 'Industrial', '03451278421', 'Karachi, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Paktia Forwarding Co', 'Third Party', '0789662310', 'Paktia, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Farah Steel & Tools', 'Manufacturing', '0796332145', 'Farah, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Gwadar Industrial Trade', 'Industrial', '03225599873', 'Gwadar, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Shinwari Distribution Lines', 'Third Party', '03014455921', 'Khyber Agency, Pakistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Kapisa Machinery Group', 'Manufacturing', '0784112574', 'Kapisa, Afghanistan', SYSDATE);
INSERT INTO companies VALUES (COMP_ID_COMP_TABLE.nextval, 'Badghis Industrial Traders', 'Industrial', '0795124783', 'Badghis, Afghanistan', SYSDATE);

