create database SALES_DATA_MANAGEMENT_SYSTEM;
use SALES_DATA_MANAGEMENT_SYSTEM;

create table customers (
customer_id int primary key not null,
customer_name varchar(45) not null,
email varchar(45) not null,
address varchar(45) not null );

create table products (
product_id int primary key not null,
product_name varchar(45) not null,
category varchar(45)not null,
price varchar(45) not null );

create table sales_representatives (
representative_id int primary key not null,
representative_name varchar(45) not null,
contact_information varchar(45) not null );

create table sales_transactions (
transaction_id int primary key not null,
transaction_date date,
customer_id int, foreign key (customer_id) references customers (customer_id),
product_id int, foreign key (product_id) references products (product_id),
quantity_sold int not null,
total_amount int not null );

insert into customers values
(201, 'awoyemi segun', 'segunasv007@gmail.com', '24A Adesola Street,Victoria Island Lagos'),
(202, 'sayo adeshola', 'sayoadeshola@gmail.com', '7C Allen Avenue, Ikeja, Lagos'),
(203, 'tayo adejumobi', 'tayoadejumobi02@gmail.com', '16B Ligali Street, Victoria Island, Lagos'),
(204, 'rabiu ridwan', 'rabiuridwan12@yahoo.com', '33A Awolowo Road, Ikoyi, Lagos'),
(205, 'ifeoluwa shoyemi', 'ifeshoyemi77@gmail.com', '10C Opebi Road, Ikeja Lagos'),
(206, 'charles chukwu', 'charleschukwu20@yahoo.com', '17D Marina Street, Lagos Island, Lagos'),
(207, 'yusuf halimat', 'yusufhalimat44@gmail.com', '2 Adeyemi Street, Victoria Island, Lagos'),
(208, 'udom udonn', 'udomudonn51@yahoom.com', '12F Adeyniyi Jones Avenue, Ikeja, Lagos'),
(209, 'ugweje peculiar', 'ugwejepeculiar11@gmail.com', '16B Bourdillon Road, Ikoyi, Lagos'),
(210, 'shola shittu', 'sholashittu261@gmail.com', '4C Toyin street, Ikeja Lagos'),
(211, 'opeymi abe', 'opeyemiabe01@gmail.com', '8B Ribadu Road, Ikoyi Lagos'),
(212, 'adenike kazeem', 'nikekazeem25@gmail.com', '21D Adekunle  Way, GRA Ikeja, Lagos'),
(213, 'favour uzowulu', 'favouruzowulu26@yahoo.com', '8C Ozumba Avenue, Victoria Island, Lagos'),
(214, 'eriken victory', 'erikenvictory11@gmail.com', '10A Olu Holloway Road, Surulere, Lagos'),
 (215, 'sanni taiwo', 'sannitaiwo56@gmail.com', '4C Ajose Street, Victoria Island, Lagos');
 
 
insert into products values
(101, 'Stellar Backpack', 'Bags', 5000),
(102, 'Banana', 'Fruits', 200),
(103, 'Tech Savvy Laptop', 'Electronics', 100000),
(104, 'Organic Green Tea', 'Beverages', 300),
(105, 'Cozy Cashmere Sweater', 'Clothing', 850),
(106, 'Fresh Farm Eggs', 'Groceries', 150),
(107, 'Diamon Stud Earrings', 'Jewelry', 50000),
(108, 'Rings', 'Jewelry', 30000),
(109, 'Floral Print Dress', 'Clothing', 10000),
(110, 'Gourment Chocolate Box', 'Food & Snacks', 3000),
(111, 'Jeans', 'Clothing', 4500),
(112, 'Rechargeable Flashlight', 'Tools & Home Improvement', 8000),
(113, 'Artisanal Hand Soap', 'Health & Beauty', 1000),
(114, 'Smart Home Security Camera', 'Security', 45000),
(115, 'Apple', 'Fruits', 250);


insert into sales_transactions values
(1, '2024-01-18', 201, 101, 5, 25000),
(2, '2024-03-17', 202, 102, 3,600),
(3, '2024-02-16', 203, 103, 2, 200000),
(4,'2024-03-15', 204, 104, 5, 1500),
(5, '2024-03-18', 205, 105, 7, 5950),
(6, '2024-02-17', 206, 106, 3, 450),
(7, '2024-03-19', 207, 107,3,  150000),
(8, '2024-02-15', 208, 108,2,  60000),
(9, '2024-06-14', 209, 109,3,  9000),
(10, '2024-01-13', 210, 110 ,2,  6000),
(11, '2024-01-18', 211, 111 ,2, 9000),
(12, '2024-03-13', 212, 112, 2,  16000),
 (13, '2024-03-17', 213, 113 ,2,2000),
 (14, '2024-04-12', 214, 114, 2, 90000),
 (15, '2024-03-11', 215, 115 ,2, 500);
 
 -- Adding a new sales transaction to the system
 insert into sales_transactions values
 (16, '2024-05-13', 214, 112, 3, 6000);
 
 -- Updating the product associated with a sales transaction.
 update sales_transactions
 set product_id = 111
 where transaction_id = 15;
 
 insert into customers values
 (216, 'patrick onye', 'patrickonye25@gmail.com', '17B Osolo way Isolo, Lagos');
 
 -- Finding the total number of sales transactions for each product category
 select p.Category, count(st.Transaction_id) as TotalTransactions
 from Products p
 join sales_transactions st
 on p.product_id = st.product_id
 group by p.category;
 
 -- Retrieving the names of customers who made purchasesin a specific month
 select c.customer_name from customers c
 join sales_transactions st
 on c.customer_id = st.customer_id
 where st.transaction_date between '2024-03-01' and '2024-03-31';
 --  where month(st.transaction_date)=3
 
 


