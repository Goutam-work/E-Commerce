create database ECommerce;
use ECommerce;
CREATE TABLE users.user_details (
    userID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    firstName varchar(20) not null,
	middleName varchar(20) null,
	lastName varchar(20) not null,
    Email varchar(50) not null unique,
	phoneNo bigint not null,
	password varchar(20) not null,
	dob date not null,
	gender varchar(10) not null,
	billAddressID int not null,
	userRole bit not null default 0,
	userStatus bit not null default 1
);
create table users.address_details(
	addressID int  IDENTITY(1,1) NOT NULL PRIMARY KEY,
	addressLine varchar(max) not null, 
	city varchar(255) not null,
	zipCode int not null,
	state varchar(255) not null,
	country varchar(255) not null,
);
alter table users.user_details add foreign key (billAddressID) references users.address_details(addressID);
CREATE TABLE product.product (
    productID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    productName varchar(255) not null,
	productImage varchar(255) null,
    subCategoryID int not null,
    quantity int not null,
	actualPrice float not null,
	discountDeduction float default 0,
	color varchar(255) null,
	weight float null,
	size varchar(255) null,
	description varchar(max) null
);
create table product.product_subCategory(
	subCategoryID int identity(1,1) not null primary key,
	subCategoryName varchar(255) not null,
	categoryID int not null
);
create table product.product_category(
	categoryID int identity(1,1) not null primary key,
	categoryName varchar(255) not null
);
ALTER TABLE product.product ADD FOREIGN KEY (subCategoryID) REFERENCES product.product_subCategory(subCategoryID);
ALTER TABLE product.product_subCategory ADD FOREIGN KEY (categoryID) REFERENCES product.product_category(categoryID);


truncate table users.user_details;
truncate table users.address_details;


truncate table product.product;
truncate table product.product_category;
truncate table product.product_subCategory;
