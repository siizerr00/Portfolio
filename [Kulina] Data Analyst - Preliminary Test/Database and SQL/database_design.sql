CREATE DATABASE ku_system;
USE ku_system;

CREATE TABLE ku_user_status (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE ku_user_location_type (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE ku_user_location_status (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE ku_user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(50),
  password_hash VARCHAR(255),
  salt VARCHAR(255),
  photo TEXT,
  status INT,
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY (status) REFERENCES ku_user_status(id)
);

CREATE TABLE ku_order_status (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE ku_product_status (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE ku_user_location (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type INT,
  status INT,
  user_id INT,
  location VARCHAR(255),
  address TEXT,
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY (type) REFERENCES ku_user_location_type(id),
  FOREIGN KEY (status) REFERENCES ku_user_location_status(id),
  FOREIGN KEY (user_id) REFERENCES ku_user(id)
);

CREATE TABLE ku_order (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  status INT,
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY (user_id) REFERENCES ku_user(id),
  FOREIGN KEY (status) REFERENCES ku_order_status(id)
);

CREATE TABLE ku_product (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  effective_date DATE,
  effective_until DATE,
  photo TEXT,
  price INT,
  status INT,
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY (status) REFERENCES ku_product_status(id)
);

CREATE TABLE ku_category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE ku_order_detail_status (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  created_at DATETIME,
  updated_at DATETIME
);

CREATE TABLE ku_product_category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  category_id INT,
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY (product_id) REFERENCES ku_product(id),
  FOREIGN KEY (category_id) REFERENCES ku_category(id)
);

CREATE TABLE ku_order_detail (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_location_id INT,
  order_id INT,
  product_id INT,
  quantity INT,
  delivery_date DATE,
  status INT,
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY (user_location_id) REFERENCES ku_user_location(id),
  FOREIGN KEY (order_id) REFERENCES ku_order(id),
  FOREIGN KEY (product_id) REFERENCES ku_product(id),
  FOREIGN KEY (status) REFERENCES ku_order_detail_status(id)
);
