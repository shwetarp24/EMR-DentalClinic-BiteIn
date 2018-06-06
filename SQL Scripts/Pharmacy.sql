CREATE TABLE biteinclinic.Pharmacy
(PharmID varchar(20) PRIMARY KEY,
PharmAddress varchar(40),
PharmZipcode int,
PrescID varchar(20),
PatientID varchar(20),
DentistID varchar(20),
Medication varchar(40),
MedicationQty int,
ManufacturerID varchar(20),
CONSTRAINT FK_ManufacttID FOREIGN KEY (ManufacturerID)
    REFERENCES Manufacturer(ManufacturerID),
CONSTRAINT FK_patienttID FOREIGN KEY (PatientID)
    REFERENCES patient(PatientID),
CONSTRAINT FK_dentisttID FOREIGN KEY (DentistID)
    REFERENCES dentist(DentistID),   
CONSTRAINT FK_PrescriptionnID FOREIGN KEY (PrescID)
    REFERENCES Prescription(PrescID)
)
