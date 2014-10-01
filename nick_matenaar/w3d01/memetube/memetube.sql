CREATE TABLE memetube (
	id INTEGER PRIMARY KEY AUTOINCREMENT, 
	title TEXT, 
	link TEXT, 
	thumbnail TEXT,
	category TEXT
);

INSERT INTO memetube (title, link, thumbnail) VALUES ("test1", "http://test1.com/?v=blah", "http://test1.jpg");

INSERT INTO memetube (title, link, thumbnail) VALUES ("test2", "http://test2.com/?v=blah", "http://test2.jpg");

INSERT INTO memetube (title, link, thumbnail) VALUES ("test3", "http://test3.com/?v=blah", "http://test3.jpg");
