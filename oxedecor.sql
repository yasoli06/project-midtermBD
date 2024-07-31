drop database if exists oxedecor;

create database oxedecor;

use oxedecor;

create table customers (
	id_customer INT primary key auto_increment,
	name VARCHAR(100),
	address VARCHAR(250),
	phone VARCHAR(20),
	email VARCHAR(100)
);

create table categories (
	id_category INT primary key auto_increment,
	name VARCHAR(100)
);

create table suppliers (
	id_supplier INT primary key auto_increment,
	name VARCHAR(100),
	contact VARCHAR(100)
);

create table products (
	id_product INT primary key auto_increment, 
	name VARCHAR(100),
	description TEXT,
	price DECIMAL(10,2),
	stock INT,
	id_category INT,
	id_supplier INT,
	foreign key (id_category) references categories(id_category),
	foreign key (id_supplier) references suppliers (id_supplier)
);
-- relacion one to many
create table orders (
	id_order INT primary key auto_increment,
	order_date DATE,
	id_customer INT,
	total DECIMAL(10,2),
	foreign key (id_customer) references customers(id_customer)
);

-- relacion one to one:
create table deliveries (
	id_customer INT primary key,
	delivery_address VARCHAR(250),
	foreign key (id_customer) references customers (id_customer)
);

alter table orders add status VARCHAR(200);
alter table orders add id_product INT;

-- many to many
create table orders_products (
	id_order INT,
	id_product INT,
	quantity INT,
	primary key (id_order, id_product),
	foreign key (id_order) references orders(id_order),
	foreign key (id_product) references products(id_product)
);

insert into customers (name, address, phone, email) values
('John Doe', '123 Elm St', '123-456-7890', 'john@example.com'),
('Jane Smith', '456 Oak St', '987-654-3210', 'jane@example.com'),
('Alice Johnson', '789 Pine St', '555-123-4567', 'alice@example.com'),
('Bob Brown', '321 Maple St', '555-987-6543', 'bob@example.com'),
('Carol White', '654 Cedar St', '555-234-5678', 'carol@example.com'),
('David Black', '987 Birch St', '555-345-6789', 'david@example.com'),
('Eva Green', '159 Spruce St', '555-456-7890', 'eva@example.com'),
('Frank Blue', '753 Willow St', '555-567-8901', 'frank@example.com'),
('Grace Red', '951 Maple St', '555-678-9012', 'grace@example.com'),
('Henry Yellow', '357 Maple St', '555-789-0123', 'henry@example.com');

INSERT INTO categories (name) VALUES
('Bandejas'),
('Aromaticos'),
('Kits'),
('Conchas'),
('Floreros'),
('Espejos'),
('Posavasos');

INSERT INTO suppliers (name, contact) VALUES
('Supplier A', 'contactA@example.com'),
('Supplier B', 'contactB@example.com'),
('Supplier C', 'contactC@example.com'),
('Supplier D', 'contactD@example.com'),
('Supplier E', 'contactE@example.com'),
('Supplier F', 'contactF@example.com'),
('Supplier G', 'contactG@example.com'),
('Supplier H', 'contactH@example.com'),
('Supplier I', 'contactI@example.com'),
('Supplier J', 'contactJ@example.com');

INSERT INTO products (name, description, price, stock, id_category, id_supplier) VALUES
('Aromatizante', 'Un aromatizante agradable', 4.00, 10, 2, 1),
('Ambientador', 'Un ambientador de calidad', 3.50, 18, 2, 2),
('Bandeja Concha', 'Una bandeja en forma de concha', 6.00, 5, 1, 3),
('Bandeja Espejo', 'Una bandeja con espejo', 6.00, 5, 1, 4),
('Bandeja Oval', 'Una bandeja ovalada', 8.50, 7, 1, 5),
('Bandeja Redonda', 'Una bandeja redonda', 13.00, 6, 1, 6),
('Florero', 'Un florero elegante', 15.00, 3, 5, 7),
('Incienso', 'Incienso aromático', 5.00, 8, 2, 8),
('Jabonera', 'Una jabonera moderna', 10.00, 9, 6, 9),
('Posavasos', 'Un set de 4 posavasos', 12.00, 3, 7, 10),
('Posavasos Mandala', 'Un set de 2 posavasos con diseño de mandala', 7.00, 3, 7, 1),
('Quemador', 'Un quemador decorativo', 7.99, 7, 2, 2),
('Vela', 'Una vela perfumada', 6.50, 7, 2, 3);

INSERT INTO orders (order_date, id_customer, total, status, id_product) VALUES
('2023-07-25', 1, 1499.98, 'Pending', 1),
('2023-07-26', 2, 999.99, 'Shipped', 2),
('2023-07-27', 3, 299.99, 'Delivered', 3),
('2023-07-28', 4, 199.99, 'Cancelled', 4),
('2023-07-29', 5, 49.99, 'Pending', 5),
('2023-07-30', 6, 399.99, 'Shipped', 6),
('2023-07-31', 7, 29.99, 'Delivered', 7),
('2023-08-01', 8, 19.99, 'Cancelled', 8),
('2023-08-02', 9, 129.99, 'Pending', 9),
('2023-08-03', 10, 99.99, 'Shipped', 10);

INSERT INTO deliveries (id_customer, delivery_address) VALUES
(1, '123 Elm St, Delivery Apt 1'),
(2, '456 Oak St, Delivery Apt 2'),
(3, '789 Pine St, Delivery Apt 3'),
(4, '321 Maple St, Delivery Apt 4'),
(5, '654 Cedar St, Delivery Apt 5'),
(6, '987 Birch St, Delivery Apt 6'),
(7, '159 Spruce St, Delivery Apt 7'),
(8, '753 Willow St, Delivery Apt 8'),
(9, '951 Maple St, Delivery Apt 9'),
(10, '357 Maple St, Delivery Apt 10');

INSERT INTO orders_products (id_order, id_product, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 1, 1),
(3, 2, 1),
(4, 3, 1),
(5, 4, 1),
(6, 5, 1),
(7, 6, 1),
(8, 7, 1),
(9, 8, 1),
(10, 9, 1);

-- Busquedas:
select * from products;

select * from customers where id_customer = 1;

select * from categories where id_category % 2 = 0;

select * from categories order by name asc;

select * from customers limit 5;

select * from orders where status like 'shipped' and id_product like '1';

select * from products where price between 5.00 and 10.00;

select * from customers where address like 'Maple';

select * from deliveries where delivery_address is null;

select count(*) from orders where status ='Pending';


-- Busquedas complejas:
select * from products where id_category = (select id_category from categories where name = 'Bandejas');

select orders.id_order, customers.name, orders.total from orders join customers on orders.id_customer = customers.id_customer;

select sum(total) as total_sales from orders;

select avg(price) as avg_price from products;

select min(price) as min_price from products;

select max(price) as max_price from products;

select id_customer, count(*) as order_count from orders group by id_customer having count(*) > 3;

select c.name, count(o.id_order) as order_count from customers c join orders o on c.id_customer = o.id_customer
where c.id_customer in (select id_customer from orders group by id_customer having count(*) > 1) group by c.name;

-- consultas multiples
select p.name as product_name, c.name as category_name, s.name as supplier_name from products p
join categories c on p.id_category = c.id_category
join suppliers s on p.id_supplier = s.id_supplier;


select o.id_order, c.name, o.total from orders o join customers c on o.id_customer = c.id_customer 
where o.total > 100.00;

select c.name, o.id_order
from customers c
left join orders o on c.id_customer = o.id_customer;

select c.name, sum(o.total) as total_spent from customers c join orders o on c.id_customer = o.id_customer group by c.name;


-- triggers:
DELIMITER //

create trigger update_stock
after insert on orders_products
for each row
begin
    update products
    set stock = stock - NEW.quantity
    where id_product = NEW.id_product;
end //

DELIMITER ;

-- mantener un registro de modificaciones en "products"
create table product_changes (
	id_change INT primary key auto_increment,
	id_product INT,
	old_price DECIMAL(10,2),
	new_price DECIMAL(10,2),
	change_date TIMESTAMP default current_timestamp
);
DELIMITER //
create trigger price_change
after update on products
for each row 
begin
	if OLD.price != NEW.price then
	insert into product_changes (id_product, old_price, new_price)
	values (NEW.id_product, OLD.price, NEW.price);
	end if;
end //

DELIMITER ;

-- transaciones
DELIMITER //
start transaction;
insert into orders(order_date, id_customer, total, status, id_product) values ('2024-08-01', 2, 50.00, 'Pending', 1);
insert into orders_products (id_order, id_product, quantity) values (last_insert_id(), 1, 2);
update products set stock = stock - 2 where id_product = 1;
commit;
DELIMITER ;
-- calcular el total de pedidos de un cliente:
DELIMITER //
create function total_orders (customer_id INT)
returns DECIMAL(10,2)
begin
	declare total DECIMAL(10,2);
	select sum(total) into total from orders where id_customer = customer_id;
	return ifnull(total, 0.00);
end;
DELIMITER ;

-- verificar producto en stock:
DELIMITER //
create function stock_product (product_id INT)
returns boolean
begin
	declare in_stock boolean;
	select stock > 0 into in_stock from products where id_product = product_id;
	return in_stock;
end;
DELIMITER ;

-- obtener nombre completo:
DELIMITER //
create function customer_name (customer_id INT)
returns VARCHAR(200)
begin
	declare full_name VARCHAR(200)
	select name into full_name from customers where id_customer = customer_id;
	return full_name;
end;
DELIMITER ;










