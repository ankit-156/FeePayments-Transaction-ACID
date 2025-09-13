# fee-payments-acid-demo

This repository contains SQL scripts to demonstrate **ACID properties (Atomicity, Consistency, Isolation, Durability)** using a simple `FeePayments` table. Each part highlights how databases enforce these properties through transactions.  

---

## 📂 Files  
- **acid_fee_payments.sql** – Complete SQL script containing:  
  - Table creation with constraints  
  - Transactions to demonstrate Atomicity, Consistency, Isolation, Durability  
  - Rollback examples  
  - Final verification query  

---

## 📝 Problem Breakdown  

### ✅ Part A – Insert Multiple Fee Payments  
- Inserts 3 fee payment records inside a transaction.  
- Demonstrates **Atomicity & Durability** (all inserts succeed, committed to DB).  

---

### ✅ Part B – Rollback on Failed Payment  
- Inserts valid + invalid record (duplicate ID, negative amount).  
- Entire transaction rolled back.  
- Demonstrates **Atomicity & Consistency**.  

---

### ✅ Part C – Simulate Partial Failure  
- Inserts one valid and one invalid record (NULL student name).  
- Rollback ensures neither record is saved.  
- Demonstrates **all-or-none Atomicity**.  

---

### ✅ Part D – Verify ACID Compliance  
- Adds two valid records and commits.  
- **Consistency**: Constraints remain valid.  
- **Isolation**: Simulated by two sessions (uncommitted insert not visible to others).  
- **Durability**: Committed records persist even after crash.  

---

## 📊 Final Output  

Below is the final state of the `FeePayments` table after all parts:  

![Final Output](assets/output.png)
