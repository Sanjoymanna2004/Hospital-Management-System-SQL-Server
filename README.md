# Hospital-Management-System-SQL-Server
📌 Project Overview

The Hospital Management System is a relational database project developed using Microsoft SQL Server. The system is designed to manage essential hospital information such as patients, doctors, departments, appointments, and billing.

The database uses Primary Keys, Foreign Keys, and relational constraints to maintain data integrity and establish relationships between different hospital modules.

🎯 Objectives
Manage patient information efficiently.
Maintain doctor and department details.
Schedule and manage patient appointments.
Store and manage patient billing information.
Reduce manual data handling.
Provide centralized and structured hospital data management.
Practice SQL queries, joins, aggregate functions, and relational database concepts.
🗂️ Database Modules

The project consists of 5 main tables:

Table	Description
Departments	Stores hospital department information
Doctors	Stores doctor details and their departments
Patients	Stores patient information
Appointments	Manages appointments between patients and doctors
Bills	Stores patient billing information
🔗 Database Relationships
Departments
     │
     │ 1
     │
     └──────────< Doctors
                    │
                    │
                    │
Patients ─────────< Appointments
    │                   │
    │                   │
    └──────────────< Bills
Relationships
One department can have multiple doctors.
One patient can have multiple appointments.
One doctor can have multiple appointments.
One patient can have multiple bills.
Primary and Foreign Keys are used to maintain relationships and data integrity.
🛠️ Technologies Used
Database: Microsoft SQL Server
Language: T-SQL
Concepts: Relational Database, Primary Key, Foreign Key, Constraints, JOIN, GROUP BY, Aggregate Functions
📋 Tables
1. Departments

Stores information about hospital departments.

Columns:

DepartmentID – Primary Key
DepartmentName – Name of the department
2. Doctors

Stores doctor information.

Columns:

DoctorID – Primary Key
DoctorName – Doctor's name
Specialization – Medical specialization
Phone – Contact number
DepartmentID – Foreign Key
3. Patients

Stores patient information.

Columns:

PatientID – Primary Key
PatientName – Patient's name
Gender – Patient's gender
Age – Patient's age
Phone – Contact number
Address – Patient's address
4. Appointments

Stores appointment information.

Columns:

AppointmentID – Primary Key
PatientID – Foreign Key
DoctorID – Foreign Key
AppointmentDate – Appointment date
Reason – Reason for appointment
5. Bills

Stores patient billing information.

Columns:

BillID – Primary Key
PatientID – Foreign Key
ConsultationFee
MedicineFee
RoomFee
TotalAmount
💻 SQL Concepts Demonstrated

The project demonstrates the following SQL Server concepts:

CREATE DATABASE
CREATE TABLE
Primary Key
Foreign Key
INSERT
SELECT
WHERE
ORDER BY
INNER JOIN
LEFT JOIN
GROUP BY
SUM()
AVG()
COUNT()
Aggregate functions
Subqueries
Data filtering
Relational database design
🔎 Example Queries
Display all patients
SELECT *
FROM Patients;
Display doctors with their departments
SELECT 
    d.DoctorName,
    d.Specialization,
    dep.DepartmentName
FROM Doctors d
INNER JOIN Departments dep
    ON d.DepartmentID = dep.DepartmentID;
Display appointment details
SELECT
    p.PatientName,
    d.DoctorName,
    a.AppointmentDate,
    a.Reason
FROM Appointments a
INNER JOIN Patients p
    ON a.PatientID = p.PatientID
INNER JOIN Doctors d
    ON a.DoctorID = d.DoctorID;
Display patient billing summary
SELECT
    p.PatientName,
    SUM(b.TotalAmount) AS TotalBill
FROM Patients p
INNER JOIN Bills b
    ON p.PatientID = b.PatientID
GROUP BY p.PatientName;
Find average bill amount
SELECT AVG(TotalAmount) AS AverageBill
FROM Bills;
Find total hospital billing
SELECT SUM(TotalAmount) AS TotalHospitalRevenue
FROM Bills;
📊 Project Benefits
Centralized hospital information.
Better organization of patient and doctor records.
Easy appointment management.
Simplified billing management.
Reduced manual record keeping.
Improved data consistency through relational constraints.
Provides a foundation for developing a hospital management application.
🚀 Future Enhancements

The database can be extended by adding:

Patient Admissions
Pharmacy Management
Laboratory Tests
Staff Management
Room Management
Payments
Medical Records
User Authentication
Stored Procedures
Triggers
Views
Hospital Management Web Application
👨‍💻 Author

Sanjoy Manna

Project

Hospital Management System – Microsoft SQL Server
