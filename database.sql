CREATE TABLE tweets (
    tweetId INTEGER PRIMARY KEY,
    username TEXT,
    text TEXT,
    time TEXT, 
    seen INTEGER DEFAULT 0
);

CREATE TABLE orders (
    tweetId INTEGER,
    id INTEGER PRIMARY KEY,
    username TEXT,
    orderSummary TEXT,
    price FLOAT,
    completed  INTEGER DEFAULT 0,
    cancelled INTEGER DEFAULT 0, 
    orderID INTEGER DEFAULT 0
);

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    username TEXT NOT NULL,
    twittername TEXT NOT NULL,
    password TEXT NOT NULL,
    email TEXT NOT NULL,
    address TEXT NOT NULL,
    postcode TEXT NOT NULL,
    phone TEXT NOT NULL,
    admin INT NOT NULL, 
    win INT DEFAULT 0, 
    promotion INTEGER DEFAULT 0,
    unique(username)
);
