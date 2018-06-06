CREATE TABLE biteinclinic.VisitingDetails
(
VisitID varchar(20) PRIMARY KEY,
Vdate datetime,
DentistID varchar(20),
PatientID varchar(20),
PatientIssue varchar(40),
SymptomID varchar(20),
PrescID varchar(20),
CONSTRAINT FK_patiID FOREIGN KEY (patientID)
    REFERENCES patient(patientID),
CONSTRAINT FK_dentID FOREIGN KEY (dentistID)
    REFERENCES dentist(dentistID),   
CONSTRAINT FK_SymptomID FOREIGN KEY (SymptomID)
    REFERENCES Symptom(SymptomID),
CONSTRAINT FK_PrescID FOREIGN KEY (PrescID)
    REFERENCES Prescription(PrescID)
)