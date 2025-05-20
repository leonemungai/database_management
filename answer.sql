create database clinicdb;

DROP TABLE IF EXISTS Bill;
DROP TABLE IF EXISTS Prescription;
DROP TABLE IF EXISTS Treatment;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Doctor_Clinic;
DROP TABLE IF EXISTS Insurance;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS Clinic;

-- Patients
CREATE TABLE Patient (
  patient_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender ENUM('Male','Female','Other') NOT NULL,
  phone VARCHAR(20) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  address TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Doctors
CREATE TABLE Doctor (
  doctor_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  specialization VARCHAR(100) NOT NULL,
  phone VARCHAR(20) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  hired_date DATE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Clinics
CREATE TABLE Clinic (
  clinic_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  address TEXT NOT NULL,
  phone VARCHAR(20) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Many-to-Many: Doctors and Clinics
CREATE TABLE Doctor_Clinic (
  doctor_id INT NOT NULL,
  clinic_id INT NOT NULL,
  assigned_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (doctor_id, clinic_id),
  FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id) ON DELETE CASCADE,
  FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Appointments
CREATE TABLE Appointment (
  appointment_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  clinic_id INT NOT NULL,
  appointment_datetime DATETIME NOT NULL,
  status ENUM('Scheduled','Completed','Canceled','No-Show') NOT NULL DEFAULT 'Scheduled',
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
  FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id)
) ENGINE=InnoDB;

-- Treatments performed during appointments
CREATE TABLE Treatment (
  treatment_id INT AUTO_INCREMENT PRIMARY KEY,
  appointment_id INT NOT NULL,
  description TEXT NOT NULL,
  treatment_date DATE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Prescriptions issued
CREATE TABLE Prescription (
  prescription_id INT AUTO_INCREMENT PRIMARY KEY,
  appointment_id INT NOT NULL,
  medication VARCHAR(200) NOT NULL,
  dosage VARCHAR(100) NOT NULL,
  instructions TEXT,
  issued_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Billing information
CREATE TABLE Bill (
  bill_id INT AUTO_INCREMENT PRIMARY KEY,
  appointment_id INT NOT NULL UNIQUE,
  amount DECIMAL(10,2) NOT NULL,
  bill_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status ENUM('Pending','Paid','Overdue') NOT NULL DEFAULT 'Pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Insurance details for patients
CREATE TABLE Insurance (
  insurance_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  provider_name VARCHAR(100) NOT NULL,
  policy_number VARCHAR(50) UNIQUE NOT NULL,
  coverage_details TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id) ON DELETE CASCADE
) ENGINE=InnoDB;