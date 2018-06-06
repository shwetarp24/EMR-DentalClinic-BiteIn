CREATE TABLE MedHistory(
MedHis varchar(20) PRIMARY KEY,
patientID varchar(20),
DentistID varchar(20),
Age int,
Gender varchar(10),
Weight decimal,
Height decimal,
BMI decimal,
BP int,
PrevDentist varchar(10),
CONSTRAINT FK_pattID FOREIGN KEY (patientID)
    REFERENCES patient(patientID),
CONSTRAINT FK_dennID FOREIGN KEY (dentistID)
    REFERENCES dentist(dentistID)
)