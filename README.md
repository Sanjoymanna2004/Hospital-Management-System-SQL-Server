# Hospital-Management-System-SQL-Server
# 🏥 Hospital Management System Database

A simple **Hospital Management System Database** developed using **Microsoft SQL Server (T-SQL)**. This project manages hospital-related information including departments, doctors, patients, appointments, and billing.

---

## 📌 Project Overview

The Hospital Management System is a relational database project designed to organize and manage essential hospital data.

The database consists of **5 interconnected tables**:

1. Departments
2. Doctors
3. Patients
4. Appointments
5. Bills

Primary Keys and Foreign Keys are used to establish relationships between tables and maintain data integrity.

---

## 🛠️ Technologies Used

* **Database:** Microsoft SQL Server
* **Language:** T-SQL
* **Concepts Used:**

  * CREATE DATABASE
  * CREATE TABLE
  * INSERT
  * SELECT
  * PRIMARY KEY
  * FOREIGN KEY
  * INNER JOIN
  * LEFT JOIN
  * WHERE
  * GROUP BY
  * SUM()
  * AVG()
  * COUNT()

---

## 📂 Database Structure

### 1. Departments

Stores information about hospital departments.

| Column Name    | Description                        |
| -------------- | ---------------------------------- |
| DepartmentID   | Unique Department ID (Primary Key) |
| DepartmentName | Name of the Department             |

---

### 2. Doctors

Stores doctor information.

| Column Name    | Description                    |
| -------------- | ------------------------------ |
| DoctorID       | Unique Doctor ID (Primary Key) |
| DoctorName     | Name of the Doctor             |
| Specialization | Doctor's Specialization        |
| Phone          | Doctor's Contact Number        |
| DepartmentID   | Department ID (Foreign Key)    |

---

### 3. Patients

Stores patient information.

| Column Name | Description                     |
| ----------- | ------------------------------- |
| PatientID   | Unique Patient ID (Primary Key) |
| PatientName | Name of the Patient             |
| Gender      | Patient Gender                  |
| Age         | Patient Age                     |
| Phone       | Patient Contact Number          |
| Address     | Patient Address                 |

---

### 4. Appointments

Stores appointment information between patients and doctors.

| Column Name     | Description                         |
| --------------- | ----------------------------------- |
| AppointmentID   | Unique Appointment ID (Primary Key) |
| PatientID       | Patient ID (Foreign Key)            |
| DoctorID        | Doctor ID (Foreign Key)             |
| AppointmentDate | Appointment Date                    |
| Reason          | Reason for Appointment              |

---

### 5. Bills

Stores patient billing information.

| Column Name     | Description                  |
| --------------- | ---------------------------- |
| BillID          | Unique Bill ID (Primary Key) |
| PatientID       | Patient ID (Foreign Key)     |
| ConsultationFee | Doctor Consultation Fee      |
| MedicineFee     | Medicine Charges             |
| RoomFee         | Room Charges                 |
| TotalAmount     | Total Bill Amount            |

---

## 🔗 Database Relationships

```text
Departments
     │
     │
     ▼
   Doctors
     │
     ▼
Appointments ◄──── Patients
                    │
                    ▼
                  Bills
```

### Relationships

* One Department can have multiple Doctors.
* One Doctor can have multiple Appointments.
* One Patient can have multiple Appointments.
* One Patient can have multiple Bills.

---

## 🚀 Database Creation

```sql
CREATE DATABASE HospitalManagement;
GO

USE HospitalManagement;
GO
```

---

## 📋 Table Creation

### Departments Table

```sql
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100) NOT NULL
);
```

### Doctors Table

```sql
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Phone VARCHAR(15),
    DepartmentID INT,

    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);
```

### Patients Table

```sql
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    PatientName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    Age INT,
    Phone VARCHAR(15),
    Address VARCHAR(200)
);
```

### Appointments Table

```sql
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Reason VARCHAR(200),

    FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID),

    FOREIGN KEY (DoctorID)
        REFERENCES Doctors(DoctorID)
);
```

### Bills Table

```sql
CREATE TABLE Bills (
    BillID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT,
    ConsultationFee DECIMAL(10,2),
    MedicineFee DECIMAL(10,2),
    RoomFee DECIMAL(10,2),
    TotalAmount DECIMAL(10,2),

    FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID)
);
```

---

## 📊 Sample Data

Each table contains **5 sample records**.

### Departments

```text
1 - Cardiology
2 - Neurology
3 - Orthopedics
4 - Pediatrics
5 - General Medicine
```

### Doctors

```text
Dr. Amit Sharma
Dr. Priya Das
Dr. Rahul Singh
Dr. Sneha Roy
Dr. Anil Kumar
```

### Patients

```text
Rahul Das
Priya Sharma
Amit Roy
Sneha Gupta
Rohit Kumar
```

---

## 🔍 Example Queries

### Display All Patients

```sql
SELECT * FROM Patients;
```

### Display Doctors with Their Departments

```sql
SELECT
    d.DoctorName,
    d.Specialization,
    dep.DepartmentName
FROM Doctors d
INNER JOIN Departments dep
    ON d.DepartmentID = dep.DepartmentID;
```

### Display Appointment Details

```sql
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
```

### Display Patient Billing Summary

```sql
SELECT
    p.PatientName,
    b.TotalAmount
FROM Patients p
INNER JOIN Bills b
    ON p.PatientID = b.PatientID;
```

### Calculate Total Hospital Revenue

```sql
SELECT
    SUM(TotalAmount) AS TotalHospitalRevenue
FROM Bills;
```

### Calculate Average Bill Amount

```sql
SELECT
    AVG(TotalAmount) AS AverageBillAmount
FROM Bills;
```

---

## 📁 Project Structure

```text
Hospital-Management-System/
│
├── README.md
├── HospitalManagement.sql
│
└── Screenshots/
```

---

## ✨ Features

* Manage hospital departments.
* Store doctor information.
* Store patient information.
* Manage doctor-patient appointments.
* Maintain patient billing records.
* Establish relationships using Primary and Foreign Keys.
* Perform multi-table queries using JOIN.
* Generate billing summaries using aggregate functions.

---

## 📚 Learning Outcomes

Through this project, the following SQL concepts were practiced:

* Relational Database Design
* Table Creation
* Primary Keys
* Foreign Keys
* Data Insertion
* Data Retrieval
* INNER JOIN
* LEFT JOIN
* Aggregate Functions
* SUM()
* AVG()
* COUNT()
* GROUP BY

---

## 🔮 Future Improvements

The project can be expanded by adding:

* Patient Admission Management
* Room Management
* Pharmacy Management
* Laboratory Test Management
* Staff Management
* Payment Management
* Stored Procedures
* Views
* Triggers
* User Authentication
* Web-based Hospital Management System

---

## 👨‍💻 Author

**Sanjoy Manna**

---

## ⭐ Conclusion

This project demonstrates the implementation of a basic **Hospital Management System using Microsoft SQL Server**. The database provides a structured way to manage hospital information and demonstrates important relational database concepts using **five interconnected tables**.

