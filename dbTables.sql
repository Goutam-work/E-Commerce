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

truncate table users.user_details;
truncate table users.address_details;