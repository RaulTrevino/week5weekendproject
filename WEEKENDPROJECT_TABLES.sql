------DEALERSHIP TABLE---------
CREATE TABLE dealership(
dealership_id serial PRIMARY KEY,
address varchar(150),
phone_number varchar(150)
);

-----CUSTOMER_SERVICE------------------------
CREATE TABLE customer_service(
customer_service_id SERIAL PRIMARY KEY,
FOREIGN KEY(dealership_id) REFERENCES dealership(dealership_id),
FOREIGN KEY(service_id) REFERENCES service(service_id),
FOREIGN KEY(finance_id) REFERENCES finance(finance_id),
FOREIGN KEY(employee_id) REFERENCES employee(employee_id),
FOREIGN KEY(service_customer_id) REFERENCES service_customer(service_customer_id),
FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);



--------------CAR TABLE--------------------
CREATE TABLE cars(
cars_id SERIAL PRIMARY KEY,
dealership_id integer NOT NULL,
_year varchar(150),   ---------------YEAR has a _ starting
make varchar(150),
model varchar(150),
color varchar(150),
_condition varchar(150),-------------- COMDITION has a _ starting
price varchar(150),
FOREIGN KEY(dealership_id) REFERENCES dealership(dealership_id)
);



---------SALES TABLE-------------
CREATE TABLE sales(
sales_id SERIAL PRIMARY KEY,
employee_id integer NOT NULL,
FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);


---------FINANCE TABLE--------------------
CREATE TABLE finance(
finance_id SERIAL PRIMARY KEY,
FOREIGN KEY(invoice_id) REFERENCES invoice(invoice_id),
FOREIGN KEY(car_id) REFERENCES cars(car_id),
FOREIGN KEY(sales_id) REFERENCES sales(sales_id),
FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
FOREIGN KEY(employee_id) REFERENCES employee(employee_id)
);

---------CUSTOMERS TABLE---------------           created
CREATE TABLE customers(
customer_id SERIAL PRIMARY KEY,
first_name varchar(150),
last_name varchar(150),
email varchar(150),
phone_number varchar(150)
);

-------SERVICE TABLE--------------
CREATE TABLE service(
service_id SERIAL PRIMARY KEY,
services varchar(150),
price_of_service varchar(150)
);


-----SERVICE_CUSTOMER---------------
CREATE TABLE service_customer(
service_customer_id  SERIAL PRIMARY KEY,
service_id integer NOT NULL,
FOREIGN KEY(service_id) REFERENCES service(service_id),
first_name varchar(150),
last_name varchar(150),
email varchar(150),
phone_number varchar(150)
);

----------SERVICE INVOICE----------
CREATE TABLE service_invoice(
service_invoice_id SERIAL PRIMARY KEY,
service_customer_id integer NOT NULL,
mechanic_id integer NOT NULL,
service_id integer NOT NULL,
FOREIGN KEY(service_customer_id) REFERENCES service_customer(service_customer_id),
FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
FOREIGN KEY(service_id) REFERENCES service(service_id),
work_done NUMERIC(8,2),
total varchar(150),
date_car_recieved date,
date_car_returned date
);,
----------MECHANIC TABLE-----------
CREATE TABLE mechanic(
mechanic_id SERIAL PRIMARY KEY,
employee_id integer NOT NULL,
FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

-------SERVICE HISTORY TABLE----------
CREATE TABLE service_history(
service_history_id SERIAL PRIMARY KEY,
service_invoice_id integer NOT NULL,
service_customer_id integer NOT NULL,
mechanic_id integer NOT NULL,
FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
FOREIGN KEY(service_customer_id) REFERENCES service_customer(service_customer_id),
FOREIGN KEY(service_invoice_id) REFERENCES service_invoice(service_invoice_id)
);


----------EMPLOYEES TABLE-----------------------
CREATE TABLE employees(
employee_id SERIAL PRIMARY KEY,
dealership_id integer NOT NULL,
FOREIGN KEY(dealership_id) REFERENCES dealership(dealership_id),
first_name varchar(150),
last_name varchar(150),
email varchar(150),
phone_number varchar(150)
);


--------- SALE INVOICE--------
CREATE TABLE sale_invoice(
sale_invoice_id SERIAL PRIMARY KEY,
sales_id integer NOT NULL,
customer_id integer NOT NULL,
cars_id integer NOT NULL,
FOREIGN KEY(sales_id) REFERENCES sales(sales_id),
FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
FOREIGN KEY(cars_id) REFERENCES cars(cars_id),
sale_amount NUMERIC(8,2)
);









