use user_db;
create TABLE users(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	email VARCHAR(100) UNIQUE
);