CREATE TABLE salesperson(
	salesperson_id serial PRIMARY KEY,
	first_name VARCHAR(55),
	last_name VARCHAR(55)
	);
INSERT INTO salesperson(
	salesperson_id,
	first_name,
	last_name
)VALUES(
	1,
	'Jon',
	'Jones'
),(
	2,
	'Jamal',
	'James'
)




CREATE TABLE customer(
	customer_id serial PRIMARY KEY,
	first_name VARCHAR(55),
	last_name VARCHAR(55),
	phone INTEGER,
	address VARCHAR(155),
	billing_info VARCHAR(155)
);

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	phone,
	address,
	billing_info
)VALUES(
	1,
	'Jerry',
	'Johnson',
	501-375-9999,
	'123 main st, oakland CA 94603',
	4242-4242-4242-4242
	
),(
	2,
	'Jim',
	'Jason',
	777-777-7777,
	'321 side st, berkeley CA 94704',
	3232-3232-3232-3232
	
);



CREATE TABLE car(
	car_id serial PRIMARY KEY,
	serial_number INTEGER,
	make VARCHAR(55),
	model VARCHAR(55),
	color VARCHAR(55),
	year_ VARCHAR(55)
);

INSERT INTO car(
	car_id,
	serial_number,
	make,
	model,
	color,
	year_
	
)VALUES(
	1,
	12345678,
	'Honda',
	'Accord',
	'Red',
	2001
),(
	2,
	87654321,
	'Honda',
	'Prelude',
	'Ruby Red',
	2020
);

CREATE TABLE sales_invoice(
	sales_invoice_id serial PRIMARY KEY,
	salesperson_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	total_price FLOAT,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	FOREIGN key(customer_id) REFERENCES customer(customer_id)
);

INSERT INTO sales_invoice(
	sales_invoice_id,
	salesperson_id,
	car_id,
	customer_id,
	total_price
)VALUES(
	1,
	1,
	1,
	1,
	80000.00
),(
	2,
	2,
	2,
	2,
	100000.00
);

SELECT *
FROM sales_invoice;

CREATE TABLE service_ticket(
 service_ticket_id serial PRIMARY KEY,
 "date" timestamp,
 customer_id INTEGER NOT NULL,
 mechanic_id INTEGER NOT NULL,
 FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
 FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);

SELECT*
FROM service_ticket

INSERT INTO service_ticket(
	service_ticket_id,
	"date",
	customer_id,
	mechanic_id
)VALUES(
	1,
	'2023-01-01 00:00:00',
	1,
	1
),(
	2,
	'2020-10-09 10:09:09',
	2,
	2
);


CREATE TABLE car_service(
 car_service_id serial PRIMARY KEY,
 description VARCHAR(155),
 service_total float,
 service_ticket_id INTEGER NOT NULL,
 mechanic_id INTEGER NOT NULL,
 car_id INTEGER NOT NULL,
 FOREIGN KEY (service_ticket_id) REFERENCES service_ticket(service_ticket_id),
 FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id),
 FOREIGN KEY (car_id) REFERENCES car(car_id)
);
INSERT INTO car_service(
	car_service_id,
	description,
	service_total,
	service_ticket_id,
	mechanic_id,
	car_id
)VALUES(
	1,
	'new alternator needed',
	100.00,
	1,
	1,
	1
),(
	2,
	'oil change',
	50.00,
	2,
	2,
	2
);
SELECT *
FROM car_service


CREATE TABLE mechanic(
	mechanic_id serial PRIMARY KEY,
	first_name VARCHAR(55),
	last_name VARCHAR(55)
);
INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name
)VALUES(
	1,
	'John',
	'Michael'
),(
	2,
	'Michael',
	'John'
);





CREATE OR REPLACE PROCEDURE insertCustomer(
fname varchar,
lname varchar,
phone integer,
address_ varchar,
billingInfo varchar
)
LANGUAGE plpgsql AS $$
BEGIN 
INSERT INTO customer(
first_name,
last_name,
phone,
address,
billing_info
)values(
Fname,
Lname,
phone,
address_,
billingInfo
);
COMMIT;
END; $$
SELECT *
FROM customer c;
CALL insertcustomer('Jen', 'Jin', 510-366-7889, '2007 Down South Drive, Houston, TX', '4545-2222-1001-4536');
CALL insertcustomer('Jackie', 'Jan', 5102906214, '411 Cuba Gooding Lane, Portland OR', '5545-0982-1991-6352');





CREATE OR REPLACE PROCEDURE insertMechanic(
fname varchar,
lname varchar
)
LANGUAGE plpgsql AS $$
BEGIN 
INSERT INTO mechanic(
first_name,
last_name
)VALUES(
fname,
lname
);
COMMIT;
END; $$
 SELECT *
FROM mechanic m;
CALL insertmechanic('Jerry', 'Jumbo');
CALL insertmechanic('Janet', 'Jam');


