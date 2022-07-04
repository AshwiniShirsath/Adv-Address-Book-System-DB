Microsoft Windows [Version 10.0.19043.1766]
(c) Microsoft Corporation. All rights reserved.

C:\Users\Ashwini>mysql -u root -p
Enter password: *****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
Server version: 8.0.29 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

====================================================
-#-UC1-create Addesss book service DB
=====================================================
mysql> create database address_book_service;
Query OK, 1 row affected (0.72 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| addressbookservice   |
| college              |
| demo                 |
| information_schema   |
| mysql                |
| performance_schema   |
| student              |
| sys                  |
| university           |
+----------------------+
10 rows in set (0.07 sec)

mysql>use address_book_service;
Database changed

=========================================================================================================================================
-#-UC2-Ability to create a Address Book Table with first andlast names, address, city,state, zip, phone numberand email as its attributes.
=========================================================================================================================================

mysql> CREATE TABLE address_book(
    ->     firstName VARCHAR(30) NOT NULL,
    ->     lastName VARCHAR(30) NOT NULL,
    ->     address VARCHAR(50) NOT NULL,
    ->     city VARCHAR(20) NOT NULL,
    ->     state VARCHAR(20) NOT NULL,
    ->     zip VARCHAR(10) NOT NULL,
    ->     phoneNo VARCHAR(15) NOT NULL,
    ->     email VARCHAR(15) NOT NULL,
    ->     PRIMARY KEY (firstName)
    -> );
Query OK, 0 rows affected (1.88 sec)

mysql> desc address_book;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| firstName | varchar(30) | NO   | PRI | NULL    |       |
| lastName  | varchar(30) | NO   |     | NULL    |       |
| address   | varchar(50) | NO   |     | NULL    |       |
| city      | varchar(20) | NO   |     | NULL    |       |
| state     | varchar(20) | NO   |     | NULL    |       |
| zip       | varchar(10) | NO   |     | NULL    |       |
| phoneNo   | varchar(15) | NO   |     | NULL    |       |
| email     | varchar(15) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
8 rows in set (0.02 sec)

===============================================================
-#-UC3-Ability to insert new Contacts to Address Book
===============================================================

mysql> insert  into address_book(firstName,lastname,address,city,state,zip,phoneNo,email) values
    ->  ('ashish','sahu','Balangir','BBSR','Odisha','543987','93929393','aaa@gmail.com'),
    ->  ('sanket','Patil','Gandhi Road','Anagar','Maharastra','414039','343929393','abc@gmail.com'),
    -> ('Harshal','Koli','sb road','amravati','Maharastra','311030','783929393','xyz@gmail.com'),
    ->  ('Ashwini','Shirsath',' road','mumbai','Maharastra','321030','723929393','xyzw@gmail.com');
Query OK, 4 rows affected (0.40 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from address_book;
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
| firstName | lastName | address     | city     | state      | zip    | phoneNo   | email          |
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
| ashish    | sahu     | Balangir    | BBSR     | Odisha     | 543987 | 93929393  | aaa@gmail.com  |
| Ashwini   | Shirsath |  road       | mumbai   | Maharastra | 321030 | 723929393 | xyzw@gmail.com |
| Harshal   | Koli     | sb road     | amravati | Maharastra | 311030 | 783929393 | xyz@gmail.com  |
| sanket    | Patil    | Gandhi Road | Anagar   | Maharastra | 414039 | 343929393 | abc@gmail.com  |
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
4 rows in set (0.00 sec)

mysql> select * from address_book_Service;
ERROR 1146 (42S02): Table 'address_book_service.address_book_service' doesn't exist
mysql> select * from address_book;
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
| firstName | lastName | address     | city     | state      | zip    | phoneNo   | email          |
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
| ashish    | sahu     | Balangir    | BBSR     | Odisha     | 543987 | 93929393  | aaa@gmail.com  |
| Ashwini   | Shirsath |  road       | mumbai   | Maharastra | 321030 | 723929393 | xyzw@gmail.com |
| Harshal   | Koli     | sb road     | amravati | Maharastra | 311030 | 783929393 | xyz@gmail.com  |
| sanket    | Patil    | Gandhi Road | Anagar   | Maharastra | 414039 | 343929393 | abc@gmail.com  |
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
4 rows in set (0.00 sec)

=================================================================
-#-UC4-Ability to edit existing contact person using their name
=================================================================

mysql> UPDATE address_book SET phoneNo = '9098765432' WHERE firstName = 'ashish';
Query OK, 1 row affected (0.20 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE address_book SET lastName = 'Nikum' WHERE firstName = 'ashish';
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+-----------+----------+-------------+----------+------------+--------+------------+----------------+
| firstName | lastName | address     | city     | state      | zip    | phoneNo    | email          |
+-----------+----------+-------------+----------+------------+--------+------------+----------------+
| ashish    | Nikum    | Balangir    | BBSR     | Odisha     | 543987 | 9098765432 | aaa@gmail.com  |
| Ashwini   | Shirsath |  road       | mumbai   | Maharastra | 321030 | 723929393  | xyzw@gmail.com |
| Harshal   | Koli     | sb road     | amravati | Maharastra | 311030 | 783929393  | xyz@gmail.com  |
| sanket    | Patil    | Gandhi Road | Anagar   | Maharastra | 414039 | 343929393  | abc@gmail.com  |
+-----------+----------+-------------+----------+------------+--------+------------+----------------+
4 rows in set (0.00 sec)

===============================================================
-#-UC5-Ability to delete person using FirstName
===============================================================

mysql> DELETE FROM `address_book` WHERE `firstName` = 'ashish';
Query OK, 1 row affected (0.07 sec)

mysql> select * from address_book;
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
| firstName | lastName | address     | city     | state      | zip    | phoneNo   | email          |
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
| Ashwini   | Shirsath |  road       | mumbai   | Maharastra | 321030 | 723929393 | xyzw@gmail.com |
| Harshal   | Koli     | sb road     | amravati | Maharastra | 311030 | 783929393 | xyz@gmail.com  |
| sanket    | Patil    | Gandhi Road | Anagar   | Maharastra | 414039 | 343929393 | abc@gmail.com  |
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
3 rows in set (0.00 sec)

==========================================================================================
-#-UC6-Ability to Retrieve Person belonging to a City or State from the Address Book
==========================================================================================
mysql> SELECT * FROM address_book WHERE city = 'Odisha';
Empty set (0.00 sec)

mysql> select * from address_book;
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
| firstName | lastName | address     | city     | state      | zip    | phoneNo   | email          |
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
| Ashwini   | Shirsath |  road       | mumbai   | Maharastra | 321030 | 723929393 | xyzw@gmail.com |
| Harshal   | Koli     | sb road     | amravati | Maharastra | 311030 | 783929393 | xyz@gmail.com  |
| sanket    | Patil    | Gandhi Road | Anagar   | Maharastra | 414039 | 343929393 | abc@gmail.com  |
+-----------+----------+-------------+----------+------------+--------+-----------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM address_book WHERE city = 'Anagar';
+-----------+----------+-------------+--------+------------+--------+-----------+---------------+
| firstName | lastName | address     | city   | state      | zip    | phoneNo   | email         |
+-----------+----------+-------------+--------+------------+--------+-----------+---------------+
| sanket    | Patil    | Gandhi Road | Anagar | Maharastra | 414039 | 343929393 | abc@gmail.com |
+-----------+----------+-------------+--------+------------+--------+-----------+---------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM address_book WHERE city = 'amravati';
+-----------+----------+---------+----------+------------+--------+-----------+---------------+
| firstName | lastName | address | city     | state      | zip    | phoneNo   | email         |
+-----------+----------+---------+----------+------------+--------+-----------+---------------+
| Harshal   | Koli     | sb road | amravati | Maharastra | 311030 | 783929393 | xyz@gmail.com |
+-----------+----------+---------+----------+------------+--------+-----------+---------------+
1 row in set (0.00 sec)

=========================================================================
-#-UC7-Ability to understand the size of address book by City and State
=========================================================================

mysql> select count(firstname) from address_book where city = 'amravati';
+------------------+
| count(firstname) |
+------------------+
|                1 |
+------------------+
1 row in set (0.03 sec)

mysql> select count(firstname) from address_book where city = 'mumbai';
+------------------+
| count(firstname) |
+------------------+
|                1 |
+------------------+
1 row in set (0.01 sec)

===========================================================================================
-#-UC8-#Ability to retrieve entries sorted alphabetically by Person’s name for a given city

===========================================================================================

mysql> SELECT firstName,city FROM address_book ORDER BY firstName;
+-----------+----------+
| firstName | city     |
+-----------+----------+
| Ashwini   | mumbai   |
| Harshal   | amravati |
| sanket    | Anagar   |
+-----------+----------+
3 rows in set (0.00 sec)

==============================================================
-#-UC9-Ability to identify each Address Book with name andType.
==============================================================

mysql> alter table address_book add type varchar(30) after lastName;
Query OK, 0 rows affected (1.49 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc address_book;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| firstName | varchar(30) | NO   | PRI | NULL    |       |
| lastName  | varchar(30) | NO   |     | NULL    |       |
| type      | varchar(30) | YES  |     | NULL    |       |
| address   | varchar(50) | NO   |     | NULL    |       |
| city      | varchar(20) | NO   |     | NULL    |       |
| state     | varchar(20) | NO   |     | NULL    |       |
| zip       | varchar(10) | NO   |     | NULL    |       |
| phoneNo   | varchar(15) | NO   |     | NULL    |       |
| email     | varchar(15) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
9 rows in set (0.00 sec)

mysql> update  address_book set type='family' where firstName ='Ashwini';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update  address_book set type='friend' where firstName ='Harshal';
Query OK, 1 row affected (0.11 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update  address_book set type='profession' where firstName ='sanket';
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+-----------+----------+------------+-------------+----------+------------+--------+-----------+----------------+
| firstName | lastName | type       | address     | city     | state      | zip    | phoneNo   | email          |
+-----------+----------+------------+-------------+----------+------------+--------+-----------+----------------+
| Ashwini   | Shirsath | family     |  road       | mumbai   | Maharastra | 321030 | 723929393 | xyzw@gmail.com |
| Harshal   | Koli     | friend     | sb road     | amravati | Maharastra | 311030 | 783929393 | xyz@gmail.com  |
| sanket    | Patil    | profession | Gandhi Road | Anagar   | Maharastra | 414039 | 343929393 | abc@gmail.com  |
+-----------+----------+------------+-------------+----------+------------+--------+-----------+----------------+
3 rows in set (0.00 sec)

==============================================================
-#-UC10-COUNT(city) AS NumberOfaddress_book FROM address_book;
==============================================================

mysql> select count(type) AS NumberOfaddress_book FROM address_book;
+----------------------+
| NumberOfaddress_book |
+----------------------+
|                    3 |
+----------------------+
1 row in set (0.02 sec)

===============================================================
-#-UC11-#Ability to add person to both Friend and Family
================================================================

mysql> update  address_book set type='friend' where firstName ='Ashwini';
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+-----------+----------+------------+-------------+----------+------------+--------+-----------+----------------+
| firstName | lastName | type       | address     | city     | state      | zip    | phoneNo   | email          |
+-----------+----------+------------+-------------+----------+------------+--------+-----------+----------------+
| Ashwini   | Shirsath | friend     |  road       | mumbai   | Maharastra | 321030 | 723929393 | xyzw@gmail.com |
| Harshal   | Koli     | friend     | sb road     | amravati | Maharastra | 311030 | 783929393 | xyz@gmail.com  |
| sanket    | Patil    | profession | Gandhi Road | Anagar   | Maharastra | 414039 | 343929393 | abc@gmail.com  |
+-----------+----------+------------+-------------+----------+------------+--------+-----------+----------------+
3 rows in set (0.00 sec)

mysql>