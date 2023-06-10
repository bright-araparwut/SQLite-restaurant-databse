.open restaurant.db

.table

.mode column

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

INSERT INTO Customer VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890'),
(2, 'Jane', 'Doe', 'jane.doe@example.com', '0987654321'),
(3, 'Robert', 'Smith', 'robert.smith@example.com', '2345678901'),
(4, 'Maria', 'Johnson', 'maria.johnson@example.com', '3456789012'),
(5, 'James', 'Williams', 'james.williams@example.com', '4567890123'),
(6, 'Linda', 'Brown', 'linda.brown@example.com', '5678901234'),
(7, 'Michael', 'Jones', 'michael.jones@example.com', '6789012345'),
(8, 'Elizabeth', 'Miller', 'elizabeth.miller@example.com', '7890123456'),
(9, 'William', 'Davis', 'william.davis@example.com', '8901234567'),
(10, 'Jennifer', 'Garcia', 'jennifer.garcia@example.com', '9012345678');

CREATE TABLE Menu (
    menu_id INT PRIMARY KEY,
    dish_name VARCHAR(50),
    price DECIMAL(5,2)
);

INSERT INTO Menu VALUES
(1, 'Pasta', 9.99),
(2, 'Steak', 14.99),
(3, 'Salad', 7.99),
(4, 'Pizza', 11.99),
(5, 'Burger', 8.99),
(6, 'Chicken', 13.99),
(7, 'Fish', 15.99),
(8, 'Ribs', 16.99),
(9, 'Sandwich', 7.99),
(10, 'Soup', 5.99);

CREATE TABLE Ingredient (
    ingredient_id INT PRIMARY KEY,
    ingredient_name VARCHAR(50),
    quantity INT
);

INSERT INTO Ingredient VALUES
(1, 'Tomatoes', 100),
(2, 'Lettuce', 80),
(3, 'Chicken', 50),
(4, 'Beef', 70),
(5, 'Cheese', 100),
(6, 'Pasta', 100),
(7, 'Bread', 80),
(8, 'Salt', 200),
(9, 'Pepper', 200),
(10, 'Onions', 80);


CREATE TABLE Rewards (
    reward_id INT PRIMARY KEY,
    customer_id INT,
    points INT,
    redeemed BOOLEAN
);

INSERT INTO Rewards VALUES
(1, 1, 500, FALSE),
(2, 2, 200, TRUE),
(3, 3, 750, FALSE),
(4, 4, 350, TRUE),
(5, 5, 800, FALSE),
(6, 6, 600, FALSE),
(7, 7, 250, TRUE),
(8, 8, 1000, FALSE),
(9, 9, 900, TRUE),
(10, 10, 550, FALSE);


CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    menu_id INT,
    transaction_date DATE,
    quantity INT
);

INSERT INTO Transactions VALUES
(1, 1, 1, '2023-01-01', 2),
(2, 2, 3, '2023-01-02', 1),
(3, 3, 2, '2023-01-03', 1),
(4, 4, 5, '2023-01-04', 1),
(5, 5, 4, '2023-01-05', 2),
(6, 6, 6, '2023-01-06', 1),
(7, 7, 7, '2023-01-07', 2),
(8, 8, 8, '2023-01-08', 1),
(9, 9, 9, '2023-01-09', 2),
(10, 10, 10, '2023-01-10', 1);

CREATE TABLE Menu_Ingredients (
    menu_id INT,
    ingredient_id INT,
    PRIMARY KEY (menu_id, ingredient_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);

INSERT INTO Menu_Ingredients (menu_id, ingredient_id) 
VALUES 
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4),
(3, 2),
(3, 5);

