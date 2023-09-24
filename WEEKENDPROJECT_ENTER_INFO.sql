INSERT INTO dealership(
dealership_id,
address,
phone_number
)
values( 
'1',
'123 Fake St. Chicago Il, 60623',
'(773)773-7337'
);

INSERT INTO cars(
cars_id,
dealership_id,
_year,
make,
model,
color,
_condition,
price
)
values('1','1','2024','Nissan','Altima SV','Black','New','30,810.00'),
('2','1','2024', 'Nissan','Altima SR AWD','Blue','New', '32,720.00'),
('3','1','2024', 'Nissan', 'Altima SL', 'White','New','37,240.00'),
('4','1','2024','Nissan','Sentra SR','Red','New','23,090.00'),
('5','1','2024','Nissan','Pathfinder SL', 'Midnight Edition','New', '46,355.00'),
('6','1','2024','Nissan', 'Pathfinder Rock Creek','Pearl White','New', '45,525.00'),
('7','1','2024','Nissan','Pathfinder Platinum', 'Red','New', '55,560.00'),
('8','1','2024','Nissan','Murano Platinum','Pearl White','New','50,870.00'),
('9','1','2024','Nissan','Kicks S','Gun Metallic','New','22,900.00'),
('10','1','2024','Nissan', 'Frontier Pro-4X','Super Black','New','48,225.00'),
('11','1','2023','Nissan','Ariya ENGAGE','Gun Metallic','New','42,735.00');

INSERT INTO employees(
employee_id,
dealership_id,
first_name,
last_name,
email,
phone_number)
values('1','1','John','Snow','JohnSnow@dealership.com','(123)456-7890'),
('2','1','Daenerys','Targaryen','daenerysTargaryen@dealership.com', '(789)456-1234' ),
('3','1','Arya','Stark','AryaStark@dealership.com','(654)789-3574' ),
('4','1','Sansa','Stark','SansaStark@dealership.com','(753)468-1594'),
('5','1','Tyrion','Lannister','TyrionLannister@dealership.com','(951)431-4769'),
('6','1','Khal','Drogo','KhalDrogo@dealership.com','(147)258-3691'),
('7','1','Eddard','Stark','EddardStark@dealership.com','(954)459-3614');

INSERT INTO sales(
sales_id,
employee_id
)
values('1','1'),('2','2'),('3','3'),('4','4'),('5','5'),('6','6'),('7','7');

INSERT INTO customers(
customer_id,
first_name,
last_name,
email,
phone_number)
values('1','Homer','Simpson','Doughnuts@gmail.com','(555)555-5556'),
('2','Ned','Flanders','Okilly-dokilly@gmail.com','(555)555-5557'),
('3','Grandpa','Simpson','AbeSimpson@gmail.com','(555)555-5558');


INSERT INTO sale_invoice(
sale_invoice_id,
sales_id,
customer_id,
cars_id,
sale_amount)
values('1','1','1','1',null),('2','2','2','2',null);

INSERT INTO service(
service_id,
services,
price_of_service)
values('1','Oil Change','39.99'),('2','5,000k Service','150.00'),('3','10k Service','250.00'),('4','15k Service','350.00'),('5','Tire Rotation','89.99');

INSERT INTO mechanic(
mechanic_id,
employee_id)
values('1','5'),('2','6'),('3',7);

INSERT INTO service_customer(
service_customer_id,
first_name,
last_name,
email,
phone_number,
service_id
)
values('1','Michael','Scott','MichaelScott@dundermifflin.com','(212)555-6733 ext2102','1');

CREATE PROCEDURE addServiceCustomer(_service_customer_id integer ,_first_name varchar,_last_name varchar,_email varchar, _phone_number varchar, _service_id integer) --------created function
LANGUAGE plpgsql AS $$
BEGIN
	INSERT INTO service_customer( service_customer_id,first_name,last_name,email, phone_number,service_id)
	VALUES(_service_customer_id,_first_name,_last_name,_email, _phone_number, _service_id);
END
$$;

CALL addServiceCustomer('2','Dwight','Schrute','DwightSchrute@dundermifflin.com','(212)555-6733 ext2103','2');


INSERT INTO service_invoice(
service_invoice_id,
service_customer_id,
mechanic_id,
service_id,
total,
work_done,
date_car_recieved,
date_car_returned)
values('1','1','1','1','45.10',null,'9/20/2023','9/20/23');

INSERT INTO service_history(
service_history_id,
service_invoice_id,
mechanic_id,
service_customer_id)
values('1','1','1','1');




