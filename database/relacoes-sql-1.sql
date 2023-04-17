-- Active: 1681685580808@@127.0.0.1@3306


-- Práticas

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL, 
    name TEXT NOT NULL, 
    email TEXT NOT NULL UNIQUE, 
    password TEXT NOT NULL
    );

SELECT * FROM users;

CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
); 

SELECT * FROM phones;

INSERT INTO users (id, name, email, password)
VALUES 
("a001", "Sanderson", "sanderson@gmail.com", "123456789"),
("a002", "Melanie", "melanie@gmail.com", "987654321");

INSERT INTO phones (id, phone_number, user_id)
VALUES
("b001", "936634432", "a001"),
("b002", "955632144", "a002"),
("b003", "945589631", "a001");



SELECT * FROM users 
INNER JOIN phones 
ON phones.user_id = users.id;


SELECT users.name, phones.phone_number FROM users 
INNER JOIN phones 
ON phones.user_id = users.id;

CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

SELECT * FROM licenses;

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)
);

SELECT * FROM drivers;

INSERT INTO licenses 
VALUES
("l001", "1213456789", "B"),
("l002", "9876543214", "A"),
("l003", "9876478569", "AB");

SELECT * FROM licenses;

INSERT INTO drivers 
VALUES
("d001", "Sanderson", "sanderson@gmail.com", "l003"),
("d002", "Melanie", "melanie@gmail.com", "l002"),
("d003", "Maria", "maria@gmail.com", "l001");

SELECT * FROM drivers;

SELECT * FROM drivers
INNER JOIN licenses
on licenses.id = license_id;

SELECT * FROM licenses 
INNER JOIN drivers
on licenses.id = license_id;

SELECT drivers.name, licenses.register_number, licenses.category FROM drivers
INNER JOIN licenses
ON license_id = licenses.id;

SELECT drivers.name, licenses.register_number, licenses.category FROM drivers
INNER JOIN licenses
ON license_id = licenses.id
WHERE drivers.name LIKE "%m%"
;

CREATE TABLE escola (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    sala TEXT NOT NULL,
    materia TEXT NOT NULL UNIQUE
);

SELECT * FROM escola; 

CREATE TABLE estudantes (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    id_sala TEXT NOT NULL,
    FOREIGN KEY (id_sala) REFERENCES escola(id)
);

SELECT * FROM estudantes; 

INSERT INTO escola 
VALUES
("e001", "405b", "história"),
("e002", "408b", "geografia"),
("e003", "303a", "portugues"),
("e004", "408c", "matemática"),
("e005", "201a", "inglês");

INSERT INTO estudantes
VALUES
("a001", "Sanderson", "e001"),
("a003", "Melanie", "e004"),
("a004", "Martins", "e005"),
("a005", "Maria", "e001"),
("a006", "Heitor", "e002"),
("a007", "Davi", "e005"),
("a008", "Juliana", "e004"),
("a009", "Gabriel", "e004"),
("a010", "Reinaldo", "e003"),
("a011", "Pedro", "e003"),
("a012", "Alisson", "e001");

SELECT estudantes.name, escola.materia FROM estudantes
INNER JOIN escola
on id_sala = escola.id;

CREATE TABLE comprador (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    cargo TEXT NOT NULL,
    pedido TEXT NOT NULL
);
DROP TABLE comprador;

CREATE TABLE produtos (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    produto TEXT NOT NULL,
    preço REAL NOT NULL,
    id_pedido TEXT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES comprador(pedido)
);

DROP TABLE produtos;

INSERT INTO comprador 
VALUES
("c001", "César", "Comprador", "ped001"),
("c002", "Luana", "CEO", "ped002"),
("c003", "Ruan", "Comprador", "ped003"),
("c004", "Chaves", "porteiro", "ped004"),
("c005", "Rita", "Comprador", "ped005");

INSERT INTO produtos
VALUES
("p001", "Lápis", 10.50, "ped005"),
("p002", "caneta", 53.00, "ped005"),
("p003", "papel", 38.25, "ped005"),
("p004", "gis", 53.12, "ped004"),
("p005", "tinta", 85.23, "ped004"),
("p006", "cimento", 100.00, "ped003"),
("p007", "lata", 315.00, "ped003"),
("p008", "porta", 500.00, "ped003"),
("p009", "camisa", 158.23, "ped002"),
("p010", "notebook", 858.20, "ped001"),
("p011", "anel", 900.00, "ped001");

SELECT * FROM comprador;

SELECT * FROM produtos;

SELECT comprador.name, produtos.produto, produtos.preço FROM comprador 
INNER JOIN produtos
on (id_pedido) = comprador.id;