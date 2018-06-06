CREATE TABLE biteinclinic.Payment(
PaymnetID varchar(20) PRIMARY KEY,
PatientID varchar(20),
DentistID varchar(20),
PayMode varchar(20),
Paydate date,
PayAmt decimal,
Balance decimal,
CONSTRAINT FK_patieID FOREIGN KEY (patientID)
    REFERENCES patient(patientID),
CONSTRAINT FK_dentisID FOREIGN KEY (dentistID)
    REFERENCES dentist(dentistID)
CONSTRAINT FK_InsuranID FOREIGN KEY (InsuranceID)
    REFERENCES Insurance(InsuranceID)
)