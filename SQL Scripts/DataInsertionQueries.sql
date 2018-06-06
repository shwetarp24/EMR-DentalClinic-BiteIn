LOAD DATA LOCAL INFILE 'C:\\prescription.txt' 
INTO TABLE BiteIn.Prescription FIELDS 
TERMINATED BY '\t' LINES TERMINATED BY '\n'
IGNORE 1 LINES(PrescID, VisitDate, PatientID, SymptomID, MedicineID, MedicineQty, MedicineName, DentistID
);

LOAD DATA LOCAL INFILE 'C:\\dentist.txt' 
INTO TABLE BiteIn.dentist FIELDS 
TERMINATED BY '\t' LINES TERMINATED BY '\n'
IGNORE 1 LINES(DentistID, FirstName, LastName, Gender, DOB, WorkEx, Contactno);

LOAD DATA LOCAL INFILE 'C:\\Insurance.txt' 
INTO TABLE BiteIn.insurance FIELDS 
TERMINATED BY '\t' LINES TERMINATED BY '\n'
IGNORE 1 LINES(InsuranceID,InsuranceName,FromDate,ToDate);

LOAD DATA LOCAL INFILE 'C:\\Receptionist.txt' 
INTO TABLE BiteIn.receptionist FIELDS 
TERMINATED BY '\t' LINES TERMINATED BY '\n'
IGNORE 1 LINES(RID,FirstName,Lastname,Gender,WorkEx,Contactno);

LOAD DATA LOCAL INFILE 'C:\\AppointmentDetails.txt' 
INTO TABLE BiteIn.appointmentdetails FIELDS 
TERMINATED BY '\t' LINES TERMINATED BY '\n'
IGNORE 1 LINES(AppID,PatientID,DentistID,AppDate,RID);

LOAD DATA LOCAL INFILE 'C:\\MedHistory.txt' 
INTO TABLE BiteIn.medhistory FIELDS 
TERMINATED BY '\t' LINES TERMINATED BY '\n'
IGNORE 1 LINES(HistoryID,PatientID,Age,Gender,Weight,Height,BMI,BP);

LOAD DATA LOCAL INFILE 'C:\\BillingInfo.txt' 
INTO TABLE BiteIn.billinginfo FIELDS 
TERMINATED BY '\t' LINES TERMINATED BY '\n'
IGNORE 1 LINES(ReceiptID,AppID,PatientID,AppDate,BillingAmt,RID);






LOAD DATA LOCAL INFILE 'C:\\Pharmacy.txt' 
INTO TABLE BiteIn.pharmacy FIELDS 
TERMINATED BY '\t' LINES TERMINATED BY '\n'
IGNORE 1 LINES(PharmID,PharmAddress,PharmZipcode,PrescID,PatientID,
DentistID,Medicine,MedicineQTY,Manufacturer);

INSERT INTO Symptom
VALUES('S01','tooth decay');
INSERT INTO Symptom
VALUES('S02','fractured teeth');
INSERT INTO symptom
VALUES ('S03','worn fillings');
INSERT INTO symptom
VALUES ('S04','gum disease ');
INSERT INTO symptom
VALUES ('S05','worn tooth enamel');
INSERT INTO symptom
VALUES('S06','exposed tooth root');

LOAD DATA LOCAL INFILE 'C:\\VisitingDetails.txt' 
INTO TABLE BiteIn.visitingdetails FIELDS 
TERMINATED BY '\t' LINES TERMINATED BY '\n'
IGNORE 1 LINES(VisitID,Vdate,DentistID,PatientID,SymptomID,PrescID);

