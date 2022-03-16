CREATE TABLE Catalog_service(
cat_serv_ID  INT NOT NULL PRIMARY KEY,
name VARCHAR(20) 
);

CREATE TABLE BOOK_PUBLISHER (
ISBN INT NOT NULL ,
PUBLISHER VARCHAR(30),
CONSTRAINT BOOK_PUBLISHER_FK1 FOREIGN KEY(ISBN) REFERENCES BOOK (ISBN) ON DELETE CASCADE);


CREATE TABLE BOOK (
ISBN CHAR(10) not null,
name VARCHAR (30) not null,
Author VARCHAR (30) NOT NULL,
publisher VARCHAR (50) NOT NULL,
state VARCHAR (20) NOT NULL, 
cat_serv_ID int ,
PRIMARY KEY(ISBN),
foreign key (cat_serv_ID) references Catalog_service(cat_serv_ID) on delete cascade
);



CREATE TABLE ROOM (
R_NUMBER INT NOT NULL PRIMARY KEY , 
STATUS VARCHAR(20) NOT NULL،
R_TYPE VARCHAR(50) NOT NULL , 
LOCATION_R VARCHAR(50) ,
TIME_START VARCHAR(20) ,
TIME_END VARCHAR(20) ,
cat_serv_ID int,
foreign key (cat_serv_ID) references Catalog_service(cat_serv_ID) on delete cascade
 ); 


CREATE TABLE Loan (
Loan_number INT NOT NULL PRIMARY KEY ,
starttime Date NOT NULL,
endtime DATE NOT NULL , 
cat_serv_ID int ,
status varchar(50),
foreign key (cat_serv_ID) references Catalog_service(cat_serv_ID) on delete cascade
)


CREATE TABLE FINE ( 
ORDER_NUM INT NOT NULL ,
ITEM VARCHAR(30) ,
AMOUNT INT NOT NULL ,
STATUS VARCHAR(30) ,
Loan_num int ,
foreign key (Loan_num) references Loan(Loan_number) on delete cascade
);


CREATE TABLE  address (
ID  INT NOT NULL PRIMARY KEY,
street VARCHAR(20)  ,
city VARCHAR(20)  ,
bulding VARCHAR(20)
);

CREATE TABLE Privilege (
num INT NOT NULL PRIMARY KEY, 
NAME VARCHAR(50) NOT NULL , 
max_num VARCHAR(50),
Loan_time DATE
);


CREATE TABLE MEMBER ( 
member_ID  INT NOT NULL PRIMARY KEY, 
NAME VARCHAR(20) NOT NULL , 
Email VARCHAR(20),
TYPE VARCHAR(20) NOT NULL, 
DOB date ,
Status VARCHAR(20),
address_id int ,
privilege_ID int ,
cat_serv_ID int ,
Phone int,
foreign key (address_id) references  address(ID) on delete cascade,
foreign key (cat_serv_ID) references Catalog_service(cat_serv_ID) on delete cascade,
foreign key (privilege_ID) references privilege(num) on delete cascade
);

CREATE TABLE RECORDING (
R_num INT NOT NULL,
R_name VARCHAR(35)NOT NULL,
R_Type   VARCHAR(15) NOT NULL,
R_Description VARCHAR(40) NOT NULL,
cat_serv_ID int ,
PRIMARY KEY (R_num),
foreign key (cat_serv_ID) references Catalog_service(cat_serv_ID) on delete cascade
);

CREATE TABLE THESIS( 
ID CHAR(9) NOT NULL, 
NAME VARCHAR(50) NOT NULL, 
LOCATION VARCHAR(50) NOT NULL, 
cat_serv_ID int ,
PRIMARY KEY (ID),
foreign key (cat_serv_ID) references Catalog_service(cat_serv_ID) on delete cascade
);

CREATE view vbookstatus as 
select ISBN , name ,Author ,publisher ,state 
from BOOK

create user USER1
IDENTIFIED by 123
default tablespace users
temporary tablespace temp
QUOTA 500K on users;

grant connect to USER1;
grant SELECT ON vbookstatus to USER1;

