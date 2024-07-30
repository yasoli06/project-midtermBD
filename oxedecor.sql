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

create table orders (
	id_order INT primary key auto_increment,
	order_date DATE,
	id_customer INT,
	total DECIMAL(10,2),
	foreign key (id_customer) references customers(id_customer)
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
	foreign key (id_supplier) references suppliers (id_supplier)
);

-- relacion one to one:
create table deliveries (
	id_customer INT primary key,
	delivery_address VARCHAR(250),
	foreign key (id_customer) references customers (id_customer)
);

alter table orders add estado VARCHAR(200);
-- relacion one to many: one cliente has many orders.
alter table orders add foreign key (id_supplier) references suppliers (id_supplier)


-- many to many
create table ordersProducts (
	id_order INT,
	id_product INT,
	quantity INT,
	primary key (id_order, id_product),
	foreign key (id_order) references orders(id_order),
	foreign key (id_product) references products(id_product)
);

-- bidireccional 
alter table products add foreign key (id_category) references categories(id_category);

insert into customers (name, address, phone, email) values
('John Doe', '123 Elm St', '123-456-7890', 'john@example.com'),
('Jane Smith', '456 Oak St', '987-654-3210', 'jane@example.com'),
('Alice Johnson', '789 Pine St', '555-123-4567', 'alice@example.com'),
('Bob Brown', '321 Maple St', '555-987-6543', 'bob@example.com'),
('Carol White', '654 Cedar St', '555-234-5678', 'carol@example.com'),
('David Black', '987 Birch St', '555-345-6789', 'david@example.com'),
('Eva Green', '159 Spruce St', '555-456-7890', 'eva@example.com'),
('Frank Blue', '753 Willow St', '555-567-8901', 'frank@example.com'),
('Grace Red', '951 Ash St', '555-678-9012', 'grace@example.com'),
('Henry Yellow', '357 Walnut St', '555-789-0123', 'henry@example.com');

insert into categories (name) values
('Electronics'),
('Furniture'),
('Home Appliances'),
('Books'),
('Clothing'),
('Toys'),
('Sporting Goods'),
('Beauty'),
('Automotive'),
('Gardening');

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
('Laptop', 'A high-performance laptop', 999.99, 50, 1, 1),
('Sofa', 'A comfortable sofa', 499.99, 20, 2, 2),
('Refrigerator', 'A large refrigerator', 799.99, 15, 3, 3),
('Book - Learn SQL', 'A book on SQL', 19.99, 100, 4, 4),
('T-Shirt', 'A comfortable T-shirt', 9.99, 200, 5, 5),
('Toy Car', 'A small toy car', 14.99, 150, 6, 6),
('Basketball', 'A standard basketball', 29.99, 60, 7, 7),
('Lipstick', 'A bright red lipstick', 24.99, 80, 8, 8),
('Car Battery', 'A reliable car battery', 129.99, 40, 9, 9),
('Lawn Mower', 'An efficient lawn mower', 299.99, 30, 10, 10);


INSERT INTO orders (order_date, id_customer, total, estado) VALUES
('2023-07-25', 1, 1499.98, 'Pending'),
('2023-07-26', 2, 999.99, 'Shipped'),
('2023-07-27', 3, 299.99, 'Delivered'),
('2023-07-28', 4, 199.99, 'Cancelled'),
('2023-07-29', 5, 49.99, 'Pending'),
('2023-07-30', 6, 399.99, 'Shipped'),
('2023-07-31', 7, 29.99, 'Delivered'),
('2023-08-01', 8, 19.99, 'Cancelled'),
('2023-08-02', 9, 129.99, 'Pending'),
('2023-08-03', 10, 99.99, 'Shipped');

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




