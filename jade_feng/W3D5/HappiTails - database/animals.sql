CREATE TABLE animals (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	gender TEXT,
	species TEXT,
	age INTEGER,
	toys INTEGER,
	owner_id INTEGER
);

INSERT INTO animals (id, name, gender, species, age, toys, owner_id) VALUES (1, "Rex", "male", "dog", 5, 0, "unadopted");
INSERT INTO animals (id, name, gender, species, age, toys, owner_id) VALUES (2, "Thumper", "male", "rabbit", 2, 1, "John");
INSERT INTO animals (id, name, gender, species, age, toys, owner_id) VALUES (3, "Andrew", "male", "rabbit", 3, 2, "unadopted");
INSERT INTO animals (id, name, gender, species, age, toys, owner_id) VALUES (4, "Polly", "female", "bird", 1, 5, "Sally");
INSERT INTO animals (id, name, gender, species, age, toys, owner_id) VALUES (5, "Jade", "female", "cat", 1, 3, "unadopted");
INSERT INTO animals (id, name, gender, species, age, toys, owner_id) VALUES (6, "Parrot", "male", "bird", 3, 2, "Sarah");

