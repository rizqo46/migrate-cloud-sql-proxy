CREATE TABLE cars (
    id SERIAL PRIMARY KEY,
    model VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    color VARCHAR(20),
    registration_number VARCHAR(20) UNIQUE
);