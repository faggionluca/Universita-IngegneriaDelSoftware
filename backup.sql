;--java -classpath "C:\Program Files (x86)\H2\bin\h2-1.4.197.jar" org.h2.tools.Script -url "jdbc:h2:./devDb" -user "sa" -password ""             
CREATE USER IF NOT EXISTS SA SALT '01336f36122d8f14' HASH '5bdf2400245909fdaed03f899e2b8f9a1040e3e60385684864f6dcd49bccb278' ADMIN;           
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_8FECE1FE_61DC_4E2F_9FA7_7543327BBA0D START WITH 67 BELONGS_TO_TABLE;   
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_6EF6B600_E7BC_4EEA_88C2_69770A392F7D START WITH 97 BELONGS_TO_TABLE;   
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_BCEE437B_079E_4233_AFD3_C1C78B997D7F START WITH 33 BELONGS_TO_TABLE;   
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_60F1D623_E0D6_4954_8538_FB4D0771E75E START WITH 33 BELONGS_TO_TABLE;   
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_3C0FCF25_54EC_4B68_AC69_D0141D00C362 START WITH 103 BELONGS_TO_TABLE;  
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_5BEC84A7_E329_4169_965F_C0A42A5CB152 START WITH 161 BELONGS_TO_TABLE;  
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_22058797_D214_4883_8CDE_90BC0435612C START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_462F80A8_A1A5_4E23_A382_B4D53332AA8D START WITH 1 BELONGS_TO_TABLE;    
CREATE CACHED TABLE PUBLIC.LINE_ITEM(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_3C0FCF25_54EC_4B68_AC69_D0141D00C362) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_3C0FCF25_54EC_4B68_AC69_D0141D00C362,
    VERSION BIGINT NOT NULL,
    PRICE INTEGER NOT NULL,
    QUANTITY INTEGER NOT NULL,
    ORDERID_ID BIGINT NOT NULL,
    SUB_PRODUCT_ID BIGINT NOT NULL
);  
ALTER TABLE PUBLIC.LINE_ITEM ADD CONSTRAINT PUBLIC.CONSTRAINT_3 PRIMARY KEY(ID);              
-- 6 +/- SELECT COUNT(*) FROM PUBLIC.LINE_ITEM;               
INSERT INTO PUBLIC.LINE_ITEM(ID, VERSION, PRICE, QUANTITY, ORDERID_ID, SUB_PRODUCT_ID) VALUES
(4, 2, 7266, 6, 1, 5),
(5, 1, 1345, 1, 1, 4),
(6, 1, 382364, 1, 1, 6),
(39, 3, 110999, 101, 35, 1),
(40, 1, 8396, 4, 35, 3),
(71, 1, 1345, 1, 35, 4);     
CREATE CACHED TABLE PUBLIC.ORDERS(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_8FECE1FE_61DC_4E2F_9FA7_7543327BBA0D) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_8FECE1FE_61DC_4E2F_9FA7_7543327BBA0D,
    VERSION BIGINT NOT NULL,
    PRICE INTEGER NOT NULL,
    USER_ID BIGINT NOT NULL,
    STATE VARCHAR(255) NOT NULL
);           
ALTER TABLE PUBLIC.ORDERS ADD CONSTRAINT PUBLIC.CONSTRAINT_8 PRIMARY KEY(ID); 
-- 2 +/- SELECT COUNT(*) FROM PUBLIC.ORDERS;  
INSERT INTO PUBLIC.ORDERS(ID, VERSION, PRICE, USER_ID, STATE) VALUES
(1, 1, 0, 2, 'placed'),
(35, 0, 0, 2, 'cart');         
CREATE CACHED TABLE PUBLIC.PRODUCT(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_5BEC84A7_E329_4169_965F_C0A42A5CB152) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_5BEC84A7_E329_4169_965F_C0A42A5CB152,
    VERSION BIGINT NOT NULL,
    CREATION_DATE TIMESTAMP NOT NULL,
    PRICE INTEGER NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    QUANTITY INTEGER NOT NULL,
    CATEGORY_ID BIGINT NOT NULL,
    DESCRIPTION VARCHAR(255) NOT NULL,
    IDENTIFIER VARCHAR(255) NOT NULL,
    PHOTO_FILE_SIZE BIGINT,
    PHOTO_CONTENT_TYPE VARCHAR(255),
    PHOTO_FILE_NAME VARCHAR(255)
);           
ALTER TABLE PUBLIC.PRODUCT ADD CONSTRAINT PUBLIC.CONSTRAINT_1 PRIMARY KEY(ID);
-- 31 +/- SELECT COUNT(*) FROM PUBLIC.PRODUCT;
INSERT INTO PUBLIC.PRODUCT(ID, VERSION, CREATION_DATE, PRICE, NAME, QUANTITY, CATEGORY_ID, DESCRIPTION, IDENTIFIER, PHOTO_FILE_SIZE, PHOTO_CONTENT_TYPE, PHOTO_FILE_NAME) VALUES
(1, 0, TIMESTAMP '2018-03-22 00:00:00', 1099, 'Giocattolo 1', 40, 1, 'Giocattolo per bambini 1', 'GIO1TTT', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(2, 0, TIMESTAMP '2018-04-06 00:00:00', 9999, 'Giocattolo 2', 5, 1, 'Giocattolo per bambini 2', 'GIO2GAO', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(3, 0, TIMESTAMP '2018-07-04 00:00:00', 2099, 'Giocattolo 3', 1000, 1, 'Giocattolo per bambini 3', 'GIO3CAT', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(4, 1, TIMESTAMP '2018-07-23 00:00:00', 1345, 'Giocattolo 4', 599, 1, 'Giocattolo per bambini 4', 'GIO4OLO', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(5, 1, TIMESTAMP '2018-08-13 00:00:00', 1211, 'Giocattolo 5', 244, 1, 'Giocattolo per bambini 5', 'GIO5OOL', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(6, 1, TIMESTAMP '2018-01-13 00:00:00', 382364, 'Computer 1', 58, 2, 'Computer per Intrattenimento 1', 'COM6MPT', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(7, 0, TIMESTAMP '2018-04-13 00:00:00', 399091, 'Computer 2', 3, 2, 'Computer per Intrattenimento 2', 'COM7UTE', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(8, 0, TIMESTAMP '2018-11-13 00:00:00', 363636, 'Computer 3', 70, 2, 'Computer per Intrattenimento 3', 'COM8REU', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(9, 0, TIMESTAMP '2018-12-13 00:00:00', 199478, 'Computer 4', 16, 2, 'Computer per Intrattenimento 4', 'COM9CUO', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(10, 0, TIMESTAMP '2018-06-13 00:00:00', 159947, 'Computer 5', 1, 2, 'Computer per Intrattenimento 5', 'COM10UCM', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(11, 0, TIMESTAMP '2018-08-13 00:00:00', 178792, 'Computer 6', 23, 2, 'Computer per Intrattenimento 6', 'COM11EER', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(12, 0, TIMESTAMP '2018-03-20 00:00:00', 3217, 'Libri 1', 600, 3, 'Libro per Intrattenimento 1', 'LIB12RIB', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(13, 0, TIMESTAMP '2018-08-21 00:00:00', 1347, 'Libri 2', 288, 3, 'Libro per Intrattenimento 1', 'LIB13LRR', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(14, 0, TIMESTAMP '2018-09-28 00:00:00', 1223, 'Libri 3', 250, 3, 'Libro per Intrattenimento 1', 'LIB14BBB', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(15, 0, TIMESTAMP '2018-11-23 00:00:00', 1393, 'Libri 4', 352, 3, 'Libro per Intrattenimento 1', 'LIB15ILR', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(16, 0, TIMESTAMP '2018-12-19 00:00:00', 3847, 'Libri 5', 947, 3, 'Libro per Intrattenimento 1', 'LIB16IIB', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(17, 0, TIMESTAMP '2019-01-11 00:00:00', 1988, 'Libri 6', 409, 3, 'Libro per Intrattenimento 1', 'LIB17RII', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(18, 0, TIMESTAMP '2018-01-19 00:00:00', 4648, 'Libri 7', 348, 3, 'Libro per Intrattenimento 1', 'LIB187RI', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(19, 0, TIMESTAMP '2018-05-11 00:00:00', 3217, 'Libri 8', 430, 3, 'Libro per Intrattenimento 1', 'LIB19ILB', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(20, 0, TIMESTAMP '2018-03-20 00:00:00', 433, 'Componente 1', 1328, 4, 'Componente Elettronico 1', 'ELE20COM', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(21, 0, TIMESTAMP '2018-03-13 00:00:00', 422, 'Componente 2', 741, 4, 'Componente Elettronico 1', 'ELE21ENT', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(22, 0, TIMESTAMP '2018-05-24 00:00:00', 130, 'Componente 3', 7926, 4, 'Componente Elettronico 1', 'ELE22EEC', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(23, 0, TIMESTAMP '2019-01-09 00:00:00', 72, 'Componente 4', 3935, 4, 'Componente Elettronico 1', 'ELE23PMN', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(24, 0, TIMESTAMP '2019-01-14 00:00:00', 450, 'Componente 5', 4565, 4, 'Componente Elettronico 1', 'ELE24TTE', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(25, 0, TIMESTAMP '2018-02-02 00:00:00', 258, 'Componente 6', 8718, 4, 'Componente Elettronico 1', 'ELE25PPT', 11462, 'image/jpeg', 'default-placeholder.jpg');               
INSERT INTO PUBLIC.PRODUCT(ID, VERSION, CREATION_DATE, PRICE, NAME, QUANTITY, CATEGORY_ID, DESCRIPTION, IDENTIFIER, PHOTO_FILE_SIZE, PHOTO_CONTENT_TYPE, PHOTO_FILE_NAME) VALUES
(26, 0, TIMESTAMP '2018-07-03 00:00:00', 355, 'Componente 7', 6375, 4, 'Componente Elettronico 1', 'ELE26MNP', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(27, 0, TIMESTAMP '2018-10-19 00:00:00', 329, 'Componente 8', 469, 4, 'Componente Elettronico 1', 'ELE27CON', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(28, 0, TIMESTAMP '2018-12-05 00:00:00', 415, 'Componente 9', 544, 4, 'Componente Elettronico 1', 'ELE28CPP', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(33, 1, TIMESTAMP '2019-01-24 01:47:08.253', 999, 'Giocattolo TOP', 1, 1, 'Super desccrizione', 'GIO33ATT', 11462, 'image/jpeg', 'default-placeholder.jpg'),
(65, 1, TIMESTAMP '2019-01-24 20:28:30.026', 4099, 'Large', 0, 1, STRINGDECODE('dsas \r\ndsa \r\nd \r\nad \r\nad \r\ns'), 'GIO65RGG', 3741, 'image/png', 'super_giocattolo.png'),
(97, 1, TIMESTAMP '2019-01-27 07:41:24.944', 1980, 'Nuovo Componente 1', 100, 4, STRINGDECODE('Piccola descrizione del componente:\r\n  - bello\r\n  - affidabile'), 'ELE97ONT', 3741, 'image/png', 'super_giocattolo.png');              
CREATE CACHED TABLE PUBLIC.PRODUCT_CATEGORY(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_60F1D623_E0D6_4954_8538_FB4D0771E75E) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_60F1D623_E0D6_4954_8538_FB4D0771E75E,
    VERSION BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL
);             
ALTER TABLE PUBLIC.PRODUCT_CATEGORY ADD CONSTRAINT PUBLIC.CONSTRAINT_39 PRIMARY KEY(ID);      
-- 4 +/- SELECT COUNT(*) FROM PUBLIC.PRODUCT_CATEGORY;        
INSERT INTO PUBLIC.PRODUCT_CATEGORY(ID, VERSION, NAME) VALUES
(1, 0, 'Giocattoli'),
(2, 0, 'Computers'),
(3, 0, 'Libri'),
(4, 0, 'Elettronica');          
CREATE CACHED TABLE PUBLIC.ROLE(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_BCEE437B_079E_4233_AFD3_C1C78B997D7F) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_BCEE437B_079E_4233_AFD3_C1C78B997D7F,
    VERSION BIGINT NOT NULL,
    AUTHORITY VARCHAR(255) NOT NULL
);    
ALTER TABLE PUBLIC.ROLE ADD CONSTRAINT PUBLIC.CONSTRAINT_2 PRIMARY KEY(ID);   
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.ROLE;    
INSERT INTO PUBLIC.ROLE(ID, VERSION, AUTHORITY) VALUES
(1, 0, 'ROLE_ADMIN'),
(2, 0, 'ROLE_DIPENDENTE'),
(3, 0, 'ROLE_USER');               
CREATE CACHED TABLE PUBLIC.PAYMENT_INFO(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_22058797_D214_4883_8CDE_90BC0435612C) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_22058797_D214_4883_8CDE_90BC0435612C,
    VERSION BIGINT NOT NULL,
    CVC INTEGER NOT NULL,
    CREDITCART INTEGER NOT NULL,
    SECURITY_CODE INTEGER NOT NULL,
    CIRCUIT VARCHAR(255) NOT NULL,
    EXPIRATION_DATE TIMESTAMP NOT NULL
);   
ALTER TABLE PUBLIC.PAYMENT_INFO ADD CONSTRAINT PUBLIC.CONSTRAINT_6 PRIMARY KEY(ID);           
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.PAYMENT_INFO;            
CREATE CACHED TABLE PUBLIC.USER(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_6EF6B600_E7BC_4EEA_88C2_69770A392F7D) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_6EF6B600_E7BC_4EEA_88C2_69770A392F7D,
    VERSION BIGINT NOT NULL,
    PASSWORD_EXPIRED BOOLEAN NOT NULL,
    USERNAME VARCHAR(255) NOT NULL,
    ACCOUNT_LOCKED BOOLEAN NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    ACCOUNT_EXPIRED BOOLEAN NOT NULL,
    ENABLED BOOLEAN NOT NULL
);          
ALTER TABLE PUBLIC.USER ADD CONSTRAINT PUBLIC.CONSTRAINT_27 PRIMARY KEY(ID);  
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.USER;    
INSERT INTO PUBLIC.USER(ID, VERSION, PASSWORD_EXPIRED, USERNAME, ACCOUNT_LOCKED, "password", ACCOUNT_EXPIRED, ENABLED) VALUES
(1, 1, FALSE, 'lucafaggion', FALSE, '$2a$10$pFva/juNt3cs6VbPowBYn.wBzkjvXH6kM/VO7xIzF2IySyVZ4Nqy6', FALSE, TRUE),
(2, 0, FALSE, 'mariorossi', FALSE, '$2a$10$iwB0P4RBONgIjJHB3O1FV.uZODQ4QmgzHRzLUVk44j1.KJL/mV9vG', FALSE, TRUE),
(3, 0, FALSE, 'giuseppebianchi', FALSE, '$2a$10$R/3g7NzG9C2aLHrlGigE0e6t20LFlKW59gtLUDFddMmdOXNLB6tRm', FALSE, TRUE);     
CREATE CACHED TABLE PUBLIC.USER_ROLE(
    USER_ID BIGINT NOT NULL,
    ROLE_ID BIGINT NOT NULL
);          
ALTER TABLE PUBLIC.USER_ROLE ADD CONSTRAINT PUBLIC.CONSTRAINT_B PRIMARY KEY(USER_ID, ROLE_ID);
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.USER_ROLE;               
INSERT INTO PUBLIC.USER_ROLE(USER_ID, ROLE_ID) VALUES
(1, 1),
(2, 3),
(3, 2);              
CREATE CACHED TABLE PUBLIC.SHIPPING_INFO(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_462F80A8_A1A5_4E23_A382_B4D53332AA8D) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_462F80A8_A1A5_4E23_A382_B4D53332AA8D,
    VERSION BIGINT NOT NULL,
    ADDRESS VARCHAR(255) NOT NULL,
    SHIPPING_TYPE VARCHAR(255) NOT NULL,
    CAP VARCHAR(255) NOT NULL,
    NUMBER INTEGER NOT NULL,
    STATE VARCHAR(255) NOT NULL
);   
ALTER TABLE PUBLIC.SHIPPING_INFO ADD CONSTRAINT PUBLIC.CONSTRAINT_D PRIMARY KEY(ID);          
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SHIPPING_INFO;           
ALTER TABLE PUBLIC.ROLE ADD CONSTRAINT PUBLIC.UK_IRSAMGNERA6ANGM0PRQ1KEMT2 UNIQUE(AUTHORITY); 
ALTER TABLE PUBLIC.USER ADD CONSTRAINT PUBLIC.UK_SB8BBOUER5WAK8VYIIY4PF2BX UNIQUE(USERNAME);  
ALTER TABLE PUBLIC.ORDERS ADD CONSTRAINT PUBLIC.FKEL9KYL84EGO2OTJ2ACCFD8MR7 FOREIGN KEY(USER_ID) REFERENCES PUBLIC.USER(ID) NOCHECK;          
ALTER TABLE PUBLIC.LINE_ITEM ADD CONSTRAINT PUBLIC.FKTRV974V5DI5E7ORC3TGJLEBVG FOREIGN KEY(SUB_PRODUCT_ID) REFERENCES PUBLIC.PRODUCT(ID) NOCHECK;             
ALTER TABLE PUBLIC.PRODUCT ADD CONSTRAINT PUBLIC.FK5CYPB0K23BOVO3RN1A5JQS6J4 FOREIGN KEY(CATEGORY_ID) REFERENCES PUBLIC.PRODUCT_CATEGORY(ID) NOCHECK;         
ALTER TABLE PUBLIC.USER_ROLE ADD CONSTRAINT PUBLIC.FK859N2JVI8IVHUI0RL0ESWS6O FOREIGN KEY(USER_ID) REFERENCES PUBLIC.USER(ID) NOCHECK;        
ALTER TABLE PUBLIC.LINE_ITEM ADD CONSTRAINT PUBLIC.FK73B3NT5GGY91EH1BE5K0LANG2 FOREIGN KEY(ORDERID_ID) REFERENCES PUBLIC.ORDERS(ID) NOCHECK;  
ALTER TABLE PUBLIC.USER_ROLE ADD CONSTRAINT PUBLIC.FKA68196081FVOVJHKEK5M97N3Y FOREIGN KEY(ROLE_ID) REFERENCES PUBLIC.ROLE(ID) NOCHECK;       
