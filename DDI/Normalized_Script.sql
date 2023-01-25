CREATE DATABASE DDI_BOUTIQA;
USE DDI_BOUTIQA;

CREATE TABLE User
(
 User_ID INT NOT NULL,
 Password VARCHAR(60) NOT NULL,
 EmailAddress VARCHAR(60) NOT NULL,
 User_Type VARCHAR(60) NOT NULL,
 FirstName VARCHAR(60) NOT NULL,
 LastName VARCHAR(60),
 PRIMARY KEY (User_ID)
);

CREATE TABLE BulkEmail
(
  BulkEmail_ID INT NOT NULL,
  Subject  VARCHAR(60) NOT NULL,
  EmailBody  VARCHAR(60) NOT NUll,
  RecepientAddress  VARCHAR(60) NOT NULL,
  User_ID INT NOT NULL,
  PRIMARY KEY (BulkEmail_ID),
  FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE Leads
(
  Lead_ID INT NOT NULL,
  FirstName VARCHAR(60) NOT NULL,
  LastName VARCHAR(60),
  ContactNo VARCHAR(60) NOT NULL,
  EmailAddress VARCHAR(60) NOT NULL,
  BulkEmail_ID INT NOT NULL,
  PRIMARY KEY (Lead_ID),
  FOREIGN KEY (BulkEmail_ID) REFERENCES BulkEmail(BulkEmail_ID)
);

CREATE TABLE AddressType
(
 AddressType_ID INT NOT NULL,
 AddressType VARCHAR(60) NOT NULL,
 PRIMARY KEY (AddressType_ID)
);

CREATE TABLE Contact_Info
(
 Contact_Info_ID INT NOT NULL,
 Unit VARCHAR(15) NOT NULL,
 City VARCHAR(60) NOT NULL,
 State VARCHAR(60) NOT NULL,
 PostalCode INT NOT NULL,
 Country VARCHAR(60) NOT NULL,
 Address_Type VARCHAR(60) NOT NULL,
 ContactMobile VARCHAR(10) NOT NULL,
 ContactOffice VARCHAR(10),
 ContactName VARCHAR(30) NOT NULL,
 User_ID INT NOT NULL,
 PRIMARY KEY (Contact_Info_ID),
 FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE Product
(
 P_Name VARCHAR(60) NOT NULL,
 P_Price DECIMAL(13,2) NOT NULL,
 ProductDetail VARCHAR(60) NOT NULL,
 ProductID INT NOT NULL,
 P_Category VARCHAR(60) NOT NULL,
 User_ID INT NOT NULL,
 PRIMARY KEY (ProductID),
 FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE UserAddressType
(
 UserAddressType_ID INT NOT NULL,
 PRIMARY KEY (UserAddressType_ID),
 User_ID INT NOT NULL,
 Contact_Info_ID INT NOT NULL,
 FOREIGN KEY (Contact_Info_ID) REFERENCES Contact_Info(Contact_Info_ID),
 FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE ShoppingCart
(
 TotalPrice DECIMAL(13,2) NOT NULL,
 ShoppingCart_ID INT NOT NULL,
 CheckOutDate DATE NOT NULL,
 Status VARCHAR(60) NOT NULL,
 User_ID INT NOT NULL,
 PRIMARY KEY (ShoppingCart_ID),
 FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE ProductShoppingCart
(
 ItemTotalPrice DECIMAL(25,2) NOT NULL,
 Quantity INT NOT NULL,
 ProductID INT NOT NULL,
 ShoppingCart_ID INT NOT NULL,
 PRIMARY KEY (ProductID, ShoppingCart_ID),
 FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
 FOREIGN KEY (ShoppingCart_ID) REFERENCES ShoppingCart(ShoppingCart_ID)
);

