CREATE TABLE shelters (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	address TEXT
);


CREATE TABLE toys (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	animal_id INTEGER
);

CREATE TABLE clients (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	children INTEGER,
	age INTEGER
);

CREATE TABLE animals (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT,
	age INTEGER,
	gender TEXT,
	species TEXT,
	client_id INTEGER
);	

--#########################******* DATA ***********###########################
--#**************************#####*******######*******************************#

--# Instantiate a Shelter 
INSERT INTO shelters (name, address) VALUES ('HappiTails', '101 Balmation St');

--# Instantiate clients.  Insert them into the shelter's clients hash
INSERT INTO clients (id, name, children, age) VALUES (1, 'Bob', 0, 'male');
INSERT INTO clients (id, name, children, age) VALUES (2, 'Sue', 2, 'female'); 
INSERT INTO clients (id, name, children, age) VALUES (3, 'Jil', 1, 'female'); 
INSERT INTO clients (id, name, children, age) VALUES (4, 'Sam', 3, 'male'); 


--# Instantiate animals.  Insert them into the shelter's animals hash
INSERT INTO animals (id, name, age, gender, species, client_id) VALUES (1, 'Spot', 3, 'male', 'Dog', 1); 
INSERT INTO animals (id, name, age, gender, species, client_id) VALUES (2, 'Lassy', 2, 'female', 'Dog', 1); 
INSERT INTO animals (id, name, age, gender, species, client_id) VALUES (3, 'Molly', 5, 'female', 'Cat', 2);
INSERT INTO animals (id, name, age, gender, species, client_id) VALUES (4, 'Fido', 8, 'male', 'Dog', 3);
INSERT INTO animals (id, name, age, gender, species, client_id) VALUES (5, 'Sport', 1, 'male', 'Dog', 4);
INSERT INTO animals (id, name, age, gender, species) VALUES (6, 'Chirpy', 2, 'female', 'Bird'); 


--# Toys
INSERT INTO toys (id, name) VALUES (1, 'Bone');
INSERT INTO toys (id, name) VALUES (2, 'Frisbee');
INSERT INTO toys (id, name) VALUES (3, 'Rope');
INSERT INTO toys (id, name) VALUES (4, 'Chew Toy');
INSERT INTO toys (id, name) VALUES (5, 'Treats');


--#**************************#####*******######*******************************#

