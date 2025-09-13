-- ================================================
-- ACID Properties Demonstration using FeePayments Table
-- ================================================

DROP TABLE IF EXISTS FeePayments;

CREATE TABLE FeePayments (
    payment_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) CHECK (amount >= 4000),
    payment_date DATE NOT NULL
);

-- ================================================
-- Part A: Insert Multiple Fee Payments (Atomicity & Durability)
-- ================================================
START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (1, 'Ashish', 5000.00, '2024-06-01');

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (2, 'Smaran', 4500.00, '2024-06-02');

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (3, 'Vaibhav', 5500.00, '2024-06-03');

COMMIT;

SELECT * FROM FeePayments;

-- ================================================
-- Part B: Rollback Demonstration (Atomicity & Consistency)
-- ================================================
START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (4, 'Kiran', 4700.00, '2024-06-05');

ROLLBACK;

SELECT * FROM FeePayments;

-- ================================================
-- Part C: Simulate Partial Failure (All-or-None Rule)
-- ================================================
START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (5, 'Rohan', 4600.00, '2024-06-07');

ROLLBACK;

SELECT * FROM FeePayments;

-- ================================================
-- Part D: Verify ACID Compliance + Isolation
-- ================================================
START TRANSACTION;

INSERT INTO FeePayments VALUES (7, 'Sneha', 4700.00, '2024-06-08');
INSERT INTO FeePayments VALUES (8, 'Arjun', 4900.00, '2024-06-09');

COMMIT;

SELECT * FROM FeePayments;
