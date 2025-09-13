DROP TABLE IF EXISTS FeePayments;

CREATE TABLE FeePayments (
    payment_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) CHECK (amount >= 4000),
    payment_date DATE NOT NULL
);

-- Part A: Insert Multiple Fee Payments
START TRANSACTION;
INSERT INTO FeePayments VALUES (1, 'Ashish', 5000.00, '2024-06-01');
INSERT INTO FeePayments VALUES (2, 'Smaran', 4500.00, '2024-06-02');
INSERT INTO FeePayments VALUES (3, 'Vaibhav', 5500.00, '2024-06-03');
COMMIT;
SELECT * FROM FeePayments;

-- Part B: Rollback Demonstration (simulate failure)
START TRANSACTION;
INSERT INTO FeePayments VALUES (4, 'Kiran', 4700.00, '2024-06-05');
-- Simulated failure: try duplicate primary key
-- Uncomment next line to see actual error
-- INSERT INTO FeePayments VALUES (1, 'DuplicateAshish', 4800.00, '2024-06-06');
ROLLBACK;
SELECT * FROM FeePayments;

-- Part C: Simulate Partial Failure (NULL student_name)
START TRANSACTION;
INSERT INTO FeePayments VALUES (5, 'Rohan', 4600.00, '2024-06-07');
-- Simulated failure: student_name cannot be NULL
-- Uncomment next line to see actual error
-- INSERT INTO FeePayments VALUES (6, NULL, 4900.00, '2024-06-08');
ROLLBACK;
SELECT * FROM FeePayments;

-- Part D: Verify ACID Compliance
START TRANSACTION;
INSERT INTO FeePayments VALUES (7, 'Sneha', 4700.00, '2024-06-08');
INSERT INTO FeePayments VALUES (8, 'Arjun', 4900.00, '2024-06-09');
COMMIT;
SELECT * FROM FeePayments;
