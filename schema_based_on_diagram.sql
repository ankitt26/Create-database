CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INTEGER,
    status VARCHAR
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    date_of_birth DATE
);
