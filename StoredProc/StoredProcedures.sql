DELIMITER $$
CREATE DEFINER=`AdmShweta`@`localhost` PROCEDURE `Appointments/Day`()
BEGIN
select count(AppID), Appdate as Dates, DentistID from appointmentdetails
group by(appdate) order by Appdate ASC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`AdmShweta`@`localhost` PROCEDURE `Billing/ApptForEachDentist`()
BEGIN
select d.DentistID, d.FirstName, d.LastName, BillingAmt from billinginfo as b join appointmentdetails as a 
on b.AppID=a.AppID join dentist as d on d.DentistID = a.DentistID;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`AdmShweta`@`localhost` PROCEDURE `Dentist>5`()
BEGIN
SELECT *FROM BITEIN.DENTIST
WHERE WORKEX>5;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`AdmShweta`@`localhost` PROCEDURE `DentistEarnings`()
BEGIN
select d.DentistID, d.FirstName, d.LastName, sum(BillingAmt) as TotEarning from billinginfo as b join appointmentdetails as a 
on b.AppID=a.AppID join dentist as d on d.DentistID = a.DentistID
group by(DentistID);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`AdmShweta`@`localhost` PROCEDURE `getAllDentists`()
BEGIN
SELECT *FROM BITEIN.DENTIST;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`AdmShweta`@`localhost` PROCEDURE `GetAllPharmacies`()
BEGIN
SELECT *FROM BITEIN.PHARMACY;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`AdmShweta`@`localhost` PROCEDURE `HighestEarningDentist`()
BEGIN
select d.DentistID, d.FirstName, d.LastName, sum(BillingAmt) as TotEarning from billinginfo as b join appointmentdetails as a 
on b.AppID=a.AppID join dentist as d on d.DentistID = a.DentistID
group by(DentistID) order by TotEarning DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`AdmShweta`@`localhost` PROCEDURE `PatientsWithWornFillings`()
BEGIN
select distinct FirstName, LastName, SymptomName, DentistID from patient as p join prescription as pr
on p.PatientID=pr.PatientID join symptom s on s.SymptomID=pr.SymptomID
where SymptomName='worn fillings'
group by(dentistID);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`AdmShweta`@`localhost` PROCEDURE `PatientVisitFrequency`()
BEGIN
select count(AppID) as TotAppointments, p.patientID, FirstName, LastName 
from appointmentdetails a join patient p on a.patientID=p.PatientID
group by(patientID) order by TotAppointments DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`AdmShweta`@`localhost` PROCEDURE `WorkLoad`()
BEGIN
select count(AppID) as TotAppointments, DentistID from appointmentdetails
group by(DentistID) order by TotAppointments ASC;
END$$
DELIMITER ;