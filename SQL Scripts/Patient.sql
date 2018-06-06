CREATE TABLE biteinclinic.Patient
(PatientID varchar(20) PRIMARY KEY,
InsuranceID varchar(20),
FirstName varchar(40),
LastName varchar(40),
Gender varchar(10),
DOB date,
Address varchar(100),
ZipCode varchar(20),
Contactno varchar(20),
CONSTRAINT FK_InsuraID FOREIGN KEY (InsuranceID)
    REFERENCES Insurance(InsuranceID) 
)