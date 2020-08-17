CREATE TABLE menu_items (
    name TEXT NOT NULL,
    toppings TEXT NOT NULL,
    vegetarian TEXT NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE side_items (
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    vegetarian TEXT NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE dessert_items (
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE drink_items (
    name TEXT NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE menu_items_london (
    name TEXT NOT NULL,
    toppings TEXT NOT NULL,
    vegetarian TEXT NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE side_items_london (
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    vegetarian TEXT NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE dessert_items_london (
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE drink_items_london (
    name TEXT NOT NULL,
    price FLOAT NOT NULL
);

INSERT INTO menu_items (name, toppings, vegetarian, price) VALUES ("Margarita", "Cheese, Tomato", "Y", 4.99);
INSERT INTO menu_items (name, toppings, vegetarian, price) VALUES ("Pepperoni", "Cheese, Tomato, Pepperoni", "N", 5.49);
INSERT INTO menu_items (name, toppings, vegetarian, price) VALUES ("American Hot", "Cheese, Tomato, Bacon, Jalepenos", "N", 6.99);
INSERT INTO menu_items (name, toppings, vegetarian, price) VALUES ("Hawaiian", "Cheese, Tomato, Ham, Pineapple", "N", 6.49);
INSERT INTO menu_items (name, toppings, vegetarian, price) VALUES ("BBQ Chicken", "Cheese, BBQ base, Peppers, Chicken Breast", "N", 7.49);
INSERT INTO menu_items (name, toppings, vegetarian, price) VALUES ("Vegetarian hot", "Cheese, Tomato, Peppers, Olives, Jalepenos", "Y", 7.99);
INSERT INTO menu_items (name, toppings, vegetarian, price) VALUES ("Meat supreme", "Cheese, Tomato, Pork meatballs, Beef, Sausage, Bacon", "N", 8.99);
INSERT INTO menu_items (name, toppings, vegetarian, price) VALUES ("Tuna Delight", "Tuna, Sweetcorn, Red onions", "Y", 5.99);

INSERT INTO side_items (name, description, vegetarian, price) VALUES ("BBQ Chicken wings", "8 BBQ wings", "N", 3.99);
INSERT INTO side_items (name, description, vegetarian, price) VALUES ("Garlic Bread", "Home-made garlic pizza bread", "Y", 1.49);
INSERT INTO side_items (name, description, vegetarian, price) VALUES ("Cheese twists", "Cheesy twirls of dough", "Y", 1.99);
INSERT INTO side_items (name, description, vegetarian, price) VALUES ("Cheese and chorizo twists", "Cheesy twirls of dough with chorizo", "N", 2.99);

INSERT INTO dessert_items (name, description, price) VALUES ("Ben and Jerrys Fish food", "Chocolate pieces in ice cream", 3.49);
INSERT INTO dessert_items (name, description, price) VALUES ("Ben and Jerrys Chocolate Fudge Brownie", "Chocolate fudge brownie ice cream", 3.99);
INSERT INTO dessert_items (name, description, price) VALUES ("Cookies", "3 x Pizza Sheds famous cookies", 1.99);
INSERT INTO dessert_items (name, description, price) VALUES ("Fruit salad", "a mix of fruit in a bowl", 1.50);

INSERT INTO drink_items (name, price) VALUES ("Coca-cola", 1.39);
INSERT INTO drink_items (name, price) VALUES ("Fanta", 1.29);
INSERT INTO drink_items (name, price) VALUES ("Lemonade", 1.19);
INSERT INTO drink_items (name, price) VALUES ("Water", 1.00);
INSERT INTO drink_items (name, price) VALUES ("Chocolate Milkshake", 3.00);

INSERT INTO menu_items_london (name, toppings, vegetarian, price) VALUES ("Margarita", "Cheese, Tomato", "Y", 4.99);
INSERT INTO menu_items_london (name, toppings, vegetarian, price) VALUES ("Pepperoni", "Cheese, Tomato, Pepperoni", "N", 5.49);
INSERT INTO menu_items_london (name, toppings, vegetarian, price) VALUES ("Pesto", "Cheese, Tomato, Pesto, Rocket, Goat cheese", "Y", 6.49);
INSERT INTO menu_items_london (name, toppings, vegetarian, price) VALUES ("Roast vegetable", "Cheese, Tomato sauce, Roast pepper, Roast tomato, Roast courgette", "Y", 6.99);
INSERT INTO menu_items_london (name, toppings, vegetarian, price) VALUES ("Tex Mex", "Cheese, Chilli base, Fajita chicken, Guacamole", "N", 9.49);
INSERT INTO menu_items_london (name, toppings, vegetarian, price) VALUES ("Chinese", "Cheese, Tomato, Chinese-style Chicken, Chilli beef, Sweet and sour sauce", "N", 7.49);
INSERT INTO menu_items_london (name, toppings, vegetarian, price) VALUES ("Seafood", "Cheese, Creamy base, Mussels, Calamari, prawns", "N", 10.99);
INSERT INTO menu_items_london (name, toppings, vegetarian, price) VALUES ("Bolognaise", "Tomato, Bolognaise, Cheese", "Y", 7.99);

INSERT INTO side_items_london (name, description, vegetarian, price) VALUES ("Cheesy garlic bread", "Home-made garlic pizza bread with cheese", "Y", 2.99);
INSERT INTO side_items_london (name, description, vegetarian, price) VALUES ("Cheese stuffed chicken nuggets", "Cheesy chicken nuggets", "N", 3.49);
INSERT INTO side_items_london (name, description, vegetarian, price) VALUES ("Hot and spicy Chicken wings", "8 spicy wings", "N", 4.99);
INSERT INTO side_items_london (name, description, vegetarian, price) VALUES ("Ceaser salad", "Salad with ceaser dressing", "Y", 2.99);
INSERT INTO side_items_london (name, description, vegetarian, price) VALUES ("Chicken ceaser salad", "Salad with ceaser dressing and chicekn", "N", 3.99);

INSERT INTO dessert_items_london (name, description, price) VALUES ("Ben and Jerrys Fish food", "Chocolate pieces in ice cream", 4.49);
INSERT INTO dessert_items_london (name, description, price) VALUES ("Apple pie", "Apple pie, with vanilla ice cream", 3.99);
INSERT INTO dessert_items_london (name, description, price) VALUES ("Cookies", "4 x Pizza Sheds famous cookies", 3.49);
INSERT INTO dessert_items_london (name, description, price) VALUES ("Sticky toffee pudding", "Classic sticky toffee pudding with vanilla ice cream", 2.50);
INSERT INTO drink_items_london (name, price) VALUES ("Coca-cola", 2.00);
INSERT INTO drink_items_london (name, price) VALUES ("Sparkling water", 1.50);
INSERT INTO drink_items_london (name, price) VALUES ("Lemonade", 2.0);
INSERT INTO drink_items_london (name, price) VALUES ("Iced coffee", 2.50);
INSERT INTO drink_items_london (name, price) VALUES ("Water", 1.50);
INSERT INTO drink_items_london (name, price) VALUES ("Banana milkshake", 3.50);
