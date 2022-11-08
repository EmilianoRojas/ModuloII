CREATE DATABASE [IF NOT EXISTS] gastosapp
USE gastosapp

CREATE TABLE User (
    "ID" int(11) NOT NULL,
    "name" varchar(255) NOT NULL,
    "password" varchar(255) NOT NULL,
    PRIMARY KEY ("ID")
)

CREATE TABLE Category (
    "ID" int(11) NOT NULL,
    "name" varchar(255) NOT NULL,
    PRIMARY KEY ("ID")
)

CREATE TABLE Transaction (
    "ID" int(11) NOT NULL,
    "ID_user" int(11) NOT NULL,
    "ID_category" int(11) NOT NULL,
    "description" varchar(255) NOT NULL,
    "amount" int(11) NOT NULL,
    "DateOfAddmission" datetime DEFAULT current_timestamp(),
    PRIMARY KEY ("ID"),
    FOREIGN KEY ("ID_user") REFERENCES "User" ("ID"),
    FOREIGN KEY ("ID_category") REFERENCES "Category" ("ID")
) 

INSERT INTO User
VALUES (1, "moises", "moises1");

INSERT INTO User
VALUES (2, "emiliano", "emiliano1");

INSERT INTO User
VALUES (3, "nati", "nati1");

INSERT INTO User
VALUES (4, "valen", "valen1");

INSERT INTO User
VALUES (5, "noah", "noah1");

INSERT INTO Category
VALUES (1, "Entretenimiento");

INSERT INTO Category
VALUES (2, "Comida");

INSERT INTO Category
VALUES (3, "Arriendo");

INSERT INTO Category
VALUES (4, "Recurrente");

INSERT INTO Category
VALUES (5, "Otros");

INSERT INTO Transaction 
VALUES (1, 1, 1, "Playstation", 500);

INSERT INTO Transaction
VALUES (2, 2, 2, "Shawarma", 5);

INSERT INTO Transaction
VALUES (3, 3, 3, "Alquiler", 200);

INSERT INTO Transaction
VALUES (4, 4, 4, "CORPOELEC", 20);

INSERT INTO Transaction
VALUES (5, 5, 5, "Medicina", 10);