-- CREATE TABLE properties (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(140), price NUMERIC, user_id INTEGER REFERENCES users (id));

ALTER TABLE properties 
ADD user_id INTEGER REFERENCES users (id);
