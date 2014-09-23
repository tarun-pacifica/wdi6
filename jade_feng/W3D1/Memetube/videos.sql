CREATE TABLE videos (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	title TEXT,
	description TEXT,
	URL_code TEXT,
	genre TEXT
);

-- , breaks up part of the statement
-- ; is the end of the statement


INSERT INTO videos (id, title, description, URL_code, genre) VALUES (0, 'Easy Snack', 'Tomato & Garlic Toast
', 'http://www.youtube.com/watch?v=llofK16FSQw', 'Food');
INSERT INTO videos (id, title, description, URL_code, genre) VALUES (1, 'Easy Snack', 'Healthy Stuffed Avocados
', 'http://www.youtube.com/watch?v=I-dWQWsjPA8', 'Food');