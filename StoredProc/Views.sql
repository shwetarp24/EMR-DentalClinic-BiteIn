 	/*Medicine Details In Prescription*/

CREATE  VIEW `MedicineDetailsInPrescription` AS
SELECT PrescID, PatientID, p.SymptomID, SymptomName, p.MedicineID, MedicineQty, DentistID, 
m.MedicineName, Manufacturer, ExpiryDate 
FROM 
Medicine m JOIN prescription p 
ON m.medicineID=p.medicineID
JOIN Symptom s
ON s.SymptomID=p.SymptomID;

 	/*Patient Details visiting the clinic*/
CREATE  VIEW `PatientDetails` AS
SELECT P.PatientID, FirstName, LastName, p.Gender, DOB, Contactno, 
Age, Weight, Height, BMI, BP 
FROM patient p JOIN medhistory h 
ON p.paatientID=h.patientID;;
USE `bitein`;
CREATE  OR REPLACE VIEW `PatientDetails` AS
SELECT P.PatientID, FirstName, LastName, Gender, DOB, Contactno, 
Age, Gender, Weight, Height, BMI, BP 
FROM patient p JOIN medhistory h 
ON p.paatientID=h.patientID;

 	/*Patient Billing and Payment Details*/
CREATE VIEW `CompleteBillingAndPaymentDetails` AS 
SELECT b.PatientID, b.ReceiptID, AppID, AppDate, BillingAmt, 
TransactionID, PayMode, PayDate, PayAmt, Balance   
FirstName, LastName FROM
BillingInfo b JOIN Payment p 
ON b.ReceiptID = p.ReceiptID 
JOIN Patient PT 
ON pt.PatientID = b.patientID;

 	/*Insurance Expiry Details for Patients*/
CREATE VIEW `InsuranceExpiryForPatients` AS
select i.InsuranceID, InsuranceName, FromDate, ToDate, FirstName, LastName, Gender, DOB, Contactno
from Insurance i join Patient p 
on i.InsuranceID = p.InsuranceID;
