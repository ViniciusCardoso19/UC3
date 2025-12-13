/* LOGICO LOJA ONLINE CORRETO: */

CREATE TABLE Order (
    ID_Order Number(8) PRIMARY KEY,
    Payment_Method String(12),
    fk_Delivery_Status_Delivery_Status_PK Bool,
    Order_Date Number(10),
    fk_Client_ID_Client Number(8)
);

CREATE TABLE Client (
    ID_Client Number(8) PRIMARY KEY,
    Email String(250),
    Delivery_Adress String(250),
    Name String(120)
);

CREATE TABLE Regular_Client (
    Register_Date Number(10),
    Loyalty_Discount Number(12),
    fk_Client_ID_Client Number(8) PRIMARY KEY
);

CREATE TABLE Vip_Client (
    Register_Date Number(10),
    Vip_Level Number(6),
    fk_Client_ID_Client Number(8) PRIMARY KEY
);

CREATE TABLE Corp_Client (
    Credit_Limit Number(8),
    CNPJ Number(20),
    Company_Name String(30),
    fk_Client_ID_Client Number(8) PRIMARY KEY
);

CREATE TABLE Product (
    Price Number(10),
    Name String(30),
    ID_Product Number(8) PRIMARY KEY,
    fk_Category_ID_Category Number(8),
    fk_Stock_ID_Stock Number(8)
);

CREATE TABLE Product_Order_Place_Order (
    Quantity Number(7),
    fk_Order_ID_Order Number(8),
    fk_Product_ID_Product Number(8)
);

CREATE TABLE Provider (
    ID_Provider Number(8) PRIMARY KEY,
    Name String(30),
    Contact Number(12)
);

CREATE TABLE Category (
    ID_Category Number(8) PRIMARY KEY,
    Name String(30)
);

CREATE TABLE Stock (
    ID_Stock Number(8) PRIMARY KEY,
    Available_Quantity Number(7)
);

CREATE TABLE Delivery_Status (
    Delivery_Status_PK Bool NOT NULL PRIMARY KEY,
    Placed Bool,
    Dispatched Bool,
    Delivered Bool,
    Ready_Pickup Bool,
    Canceled Bool
);

CREATE TABLE Supply (
    fk_Product_ID_Product Number(8),
    fk_Provider_ID_Provider Number(8)
);
 
ALTER TABLE Order ADD CONSTRAINT FK_Order_2
    FOREIGN KEY (fk_Delivery_Status_Delivery_Status_PK)
    REFERENCES Delivery_Status (Delivery_Status_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Order ADD CONSTRAINT FK_Order_3
    FOREIGN KEY (fk_Client_ID_Client)
    REFERENCES Client (ID_Client)
    ON DELETE RESTRICT;
 
ALTER TABLE Regular_Client ADD CONSTRAINT FK_Regular_Client_2
    FOREIGN KEY (fk_Client_ID_Client)
    REFERENCES Client (ID_Client)
    ON DELETE CASCADE;
 
ALTER TABLE Vip_Client ADD CONSTRAINT FK_Vip_Client_2
    FOREIGN KEY (fk_Client_ID_Client)
    REFERENCES Client (ID_Client)
    ON DELETE CASCADE;
 
ALTER TABLE Corp_Client ADD CONSTRAINT FK_Corp_Client_2
    FOREIGN KEY (fk_Client_ID_Client)
    REFERENCES Client (ID_Client)
    ON DELETE CASCADE;
 
ALTER TABLE Product ADD CONSTRAINT FK_Product_2
    FOREIGN KEY (fk_Category_ID_Category)
    REFERENCES Category (ID_Category)
    ON DELETE RESTRICT;
 
ALTER TABLE Product ADD CONSTRAINT FK_Product_3
    FOREIGN KEY (fk_Stock_ID_Stock)
    REFERENCES Stock (ID_Stock)
    ON DELETE RESTRICT;
 
ALTER TABLE Product_Order_Place_Order ADD CONSTRAINT FK_Product_Order_Place_Order_1
    FOREIGN KEY (fk_Order_ID_Order)
    REFERENCES Order (ID_Order);
 
ALTER TABLE Product_Order_Place_Order ADD CONSTRAINT FK_Product_Order_Place_Order_2
    FOREIGN KEY (fk_Product_ID_Product)
    REFERENCES Product (ID_Product);
 
ALTER TABLE Supply ADD CONSTRAINT FK_Supply_1
    FOREIGN KEY (fk_Product_ID_Product)
    REFERENCES Product (ID_Product)
    ON DELETE RESTRICT;
 
ALTER TABLE Supply ADD CONSTRAINT FK_Supply_2
    FOREIGN KEY (fk_Provider_ID_Provider)
    REFERENCES Provider (ID_Provider)
    ON DELETE RESTRICT;