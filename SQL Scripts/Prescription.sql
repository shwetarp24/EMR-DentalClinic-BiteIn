CREATE TABLE biteinclinic.Prescription
(PrescID varchar(20) PRIMARY KEY,
VisitDate date,
PatientID varchar(20),
InsuranceID varchar(20),
SymptomID varchar(20),
Medication varchar(40),
MedicationQty int,
ManufacturerName varchar(20),
CONSTRAINT FK_InsuraceID FOREIGN KEY (InsuranceID)
    REFERENCES Insurance(InsuranceID)
)

