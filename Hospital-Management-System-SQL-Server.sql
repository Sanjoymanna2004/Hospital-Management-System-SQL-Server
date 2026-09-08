CREATE DATABASE HospitalManagementDB;
GO

USE HospitalManagementDB;
GO

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Phone VARCHAR(15),
    DepartmentID INT,

    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    PatientName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    Age INT,
    Phone VARCHAR(15),
    Address VARCHAR(200)
);

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