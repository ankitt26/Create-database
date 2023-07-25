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

ALTER TABLE medical_histories 
ADD FOREIGN KEY(patient_id) REFERENCES patients(id);


CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_histories_id INT REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
);


CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);

ALTER TABLE medical_histories 
ADD FOREIGN KEY (id) REFERENCES treatments(id);


CREATE TABLE medical_history_treatments (
    id SERIAL PRIMARY KEY,
    medical_history_id INT REFERENCES medical_histories(id),
    treatment_id INT REFERENCES treatments(id)
);


CREATE INDEX  ON medical_histories (patient_id);
CREATE INDEX  ON invoices (medical_histories_id);
CREATE INDEX  ON medical_histories (id);
CREATE INDEX  ON invoice_items (invoice_id);
CREATE INDEX  ON invoice_items (treatment_id);
CREATE INDEX  ON medical_history_treatments (medical_histories_id);
CREATE index  on medical_history_treatments (treatment_id)