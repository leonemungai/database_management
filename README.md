# database_management

# 🏥 Clinic Booking System Database

## 📌 Project Title
**Clinic Booking System (MySQL Relational Database)**

## 📄 Description

This project is a fully-featured relational database system for managing a clinic's operations. It supports:

- Patient registration and insurance
- Doctor profiles and clinic assignments
- Scheduling and tracking of appointments
- Treatments and prescriptions
- Billing and payment status

It uses a normalized MySQL schema with appropriate primary keys, foreign keys, and relational constraints (1-1, 1-M, M-M) for robust data integrity.

## 🚀 Setup / How to Run the Project

1. **Requirements**
   - MySQL 8.0+ installed and running
   - A database GUI tool like MySQL Workbench, DBeaver, or phpMyAdmin (optional but recommended)

2. **Steps to Import**
   - Open your MySQL interface or CLI
   - Create a new database:
     ```sql
     CREATE DATABASE clinicDB;
     USE clinicDB;
     ```
   - Import the SQL schema:
     - If using CLI:
       ```bash
       mysql -u [username] -p clinicDB < clinic_booking_system.sql
       ```
     - Or copy-paste the content of `clinic_booking_system.sql` into your SQL editor and run the script.

3. **Done!**
   You now have a working database schema to start inserting test data or integrate with an application.

## 🧠 ERD (Entity Relationship Diagram)

You can view or generate the ERD using MySQL Workbench or online tools.

### 🔗 Sample ERD Link:
[View ERD on dbdiagram.io]([https://dbdiagram.io/d/682cc81ab9f7446da36173ff)


## 📂 Project Structure

