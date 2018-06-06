CREATE TABLE biteinclinic.BillingInfo
(
ReceiptID varchar(20) PRIMARY KEY,
AppID varchar(20),
patientID varchar(20),
InsuranceID varchar(20),
DentistID varchar(20),
AppDate Datetime,
BillingAmt decimal,
CONSTRAINT FK_patID FOREIGN KEY (patientID)
    REFERENCES patient(patientID),
CONSTRAINT FK_denID FOREIGN KEY (dentistID)
    REFERENCES dentist(dentistID),   
CONSTRAINT FK_AppID FOREIGN KEY (AppID)
    REFERENCES AppointmentDetails(AppID),   
CONSTRAINT FK_InsurID FOREIGN KEY (InsuranceID)
    REFERENCES Insurance(InsuranceID)   
)
