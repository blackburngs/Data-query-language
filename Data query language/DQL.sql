CREATE TABLE Product(
    Product_id VARCHAR(20) CONSTRAINT pk_product PRIMARY KEY,
    product_name VARCHAR(20) CONSTRAINT cons_product NOT NULL,
    Price NUMBER CONSTRAINT check_price CHECK (Price>0).
);
DESCRIBE Product;

CREATE TABLE Orders(
    Costumer_id VARCHAR(20) CONSTRAINT pk_costumer PRIMARY KEY,
    Product_id VARCHAR(20),
    quantity NUMBER,
    total_amount NUMBER,
    CONSTRAINT fk_costumer FOREIGN KEY (Costumer_id) REFERENCES Costumers (Costumer_id),
    CONSTRAINT fk_product FOREIGN Key (Product_id) REFERENCES Producs (Product_id),
);
DESCRIBE Orders;

CREATE TABLE Costumers(
    Costumer_id VARCHAR(20),
    Costumer_name VARCHAR(20) CONSTRAINT cons_costumer NOT NULL.
    Costumer_tel NUMBER,
);
DESCRIBE Costumers;


SELECT * FROM Costumers;

SELECT product_name, Category FROM Product WHERE Price Berween 5000 AND 10000;

SELECT * FROM Product ORDER BY Price DESC;

SELECT SUM(quantity), AVG(quantity), MAX(total_amount) AS max_total, MIN(total_amount) AS min_total FROM Orders GROUP BY Product_id;

SELECT Customer_id FROM Orders WHERE quantity>2;

SELECT month(OrderDate) AS month_name, quantity AS sum_of_month FROM Orders WHERE YEAR(OrderDate) = 2020 GROUP BY month(OrderDate);

SELECT product_name, Customer_name, OrderDate FROM Product, Customers, Orders GROUP BY OrderDate;

SELECT * FROM Orders WHERE month(OrderDate) = 07;

SELECT Customer_id FROM Orders WHERE quantity = NULL;