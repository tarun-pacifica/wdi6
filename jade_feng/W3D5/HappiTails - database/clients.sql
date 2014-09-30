CREATE TABLE clients (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	age INTEGER,
	num_children INTEGER
);

INSERT INTO clients (id, name, age, num_children) VALUES (1, "Sally", 24, 1);
INSERT INTO clients (id, name, age, num_children) VALUES (2, "John", 40, 2);
INSERT INTO clients (id, name, age, num_children) VALUES (3, "Jack", 50, 3);
INSERT INTO clients (id, name, age, num_children) VALUES (4, "James", 20, 0);
INSERT INTO clients (id, name, age, num_children) VALUES (5, "John", 35, 2);
INSERT INTO clients (id, name, age, num_children) VALUES (6, "Sarah", 20, 1);

