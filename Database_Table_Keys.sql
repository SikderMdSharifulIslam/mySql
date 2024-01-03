CREATE DATABASE GreenBank;

CREATE TABLE branch (
    branch_name varchar(20),
    branch_city varchar(20),
    assets varchar(20),
    PRIMARY KEY (branch_name)
);

CREATE TABLE customer (
    customer_id int,
    customer_name varchar(20),
    customer_city varchar(20),
    PRIMARY KEY (customer_name)
);


CREATE TABLE account (
    account_number varchar(20),
    branch_name varchar(20),
    balance int,
    PRIMARY KEY (account_number),
    FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
);


CREATE TABLE loan(
    loan_number varchar(20),
    branch_name varchar(20),
    amount int,
    PRIMARY KEY (loan_number),
    FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
);


CREATE TABLE depositor(
    customer_name varchar(20),
    account_number varchar(20),
    FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
    FOREIGN KEY(account_number) REFERENCES account(account_number)
);

CREATE TABLE borrower(
    customer_name varchar(20),
    loan_number varchar(20),
    FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
    FOREIGN KEY(loan_number) REFERENCES loan(loan_number)
);



INSERT INTO branch VALUES ('Mirpur', 'Dhaka', 'Thousand Cores'),
			  ('Farmgate', 'Comilla', 'Hundred Cores'),
                          ('Dhanmondi', 'Chottogram', 'Seven Cores'),
                          ('Gulshan', 'Rajshahi', 'Ten Cores'),
                          ('Banani', 'Rangpur', 'Fifty Cores');


INSERT INTO customer VALUES (101, 'Sikder', 'Dhaka'),
			  (102, 'Mujahid', 'Comilla'),
                          (103, 'Mahmudul', 'Chottogram'),
                          (104, 'Akash', 'Rajshahi'),
                          (105, 'Salman', 'Rangpur');


INSERT INTO account VALUES ('ABC123', 'Mirpur', 100),
			  ('A1B2C3', 'Farmgate', 200),
                          ('A11B22C33', 'Dhanmondi', 300),
                          ('AA1BB2CC3', 'Gulshan', 400),
                          ('AA11BB22CC33', 'Banani', 500);


INSERT INTO loan VALUES ('ABCXXX', 'Mirpur', 10),
			  ('XXXABC', 'Farmgate', 20),
                          ('AXXBXXCXX', 'Dhanmondi', 30),
                          ('AAXBBXCCX', 'Gulshan', 40),
                          ('AAXXBBXXCCXX', 'Banani', 50);


INSERT INTO depositor VALUES ('Sikder', 'ABC123'),
			  ('Mujahid', 'A1B2C3'),
                          ('Mahmudul', 'A11B22C33'),
                          ('Akash', 'AA1BB2CC3'),
                          ('Salman', 'AA11BB22CC33');


INSERT INTO borrower VALUES ('Sikder', 'ABCXXX'),
			  ('Mujahid', 'XXXABC'),
                          ('Mahmudul', 'AXXBXXCXX'),
                          ('Akash', 'AAXBBXCCX'),
                          ('Salman', 'AAXXBBXXCCXX');

INSERT INTO borrower VALUES ('Sikder', 'ABCXXX'),
			  ('Mujahid', 'XXXABC'),
                          ('Mahmudul', 'AXXBXXCXX'),
                          ('Akash', 'AAXBBXCCX'),
                          ('Salman', 'AAXXBBXXCCXX');


ALTER TABLE customer ADD COLUMN email varchar(20);
UPDATE customer SET email='sikder@gmail.com' WHERE customer_name='Sikder';
ALTER TABLE customer CHANGE COLUMN customer_city customer_location varchar(20);  
ALTER TABLE branch CHANGE COLUMN assets assets char(20);  