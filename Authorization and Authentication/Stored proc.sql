-- only patient should be able to see dentist work experience
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Dentist>5`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
CALL `bitein`.`UserAuth`(@USERNAME, @PASS, @ROLE);
IF @User_exists > 0 THEN
IF @ROLE='P' THEN 
	SELECT *FROM BITEIN.DENTIST
	WHERE WORKEX>5;
ELSE 
	SET @message_text = ('User not authorized');
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;	
END IF;
END IF;
END$$
DELIMITER ;
;

-- Only Dentist should be able to see his appointments
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Appointments/Day`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
CALL `bitein`.`UserAuth`(@USERNAME, @PASS, @ROLE);
IF @User_exists > 0 THEN
IF @ROLE='D' THEN 
	select count(AppID), Appdate as Dates, DentistID from appointmentdetails
	group by(appdate) order by Appdate ASC;
ELSE 
	SET @message_text = ('User not authorized');
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
END IF;
END IF;
END$$
DELIMITER ;

-- Only Receptionist should be able to see billing details
 	DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Billing/ApptForEachDentist`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
CALL `bitein`.`UserAuth`(@USERNAME, @PASS, @ROLE);
IF @User_exists > 0 THEN
IF @ROLE='R' THEN
	select d.DentistID, d.FirstName, d.LastName, BillingAmt from billinginfo as b join appointmentdetails as a 
	on b.AppID=a.AppID join dentist as d on d.DentistID = a.DentistID;
ELSE 
	SET @message_text = ('User not authorized');
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
END IF;
END IF;
END$$
DELIMITER ;

-- Only Admin should be able to see Dentist earnings for  the clinic
 	DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DentistEarnings`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
CALL `bitein`.`UserAuth`(@USERNAME, @PASS, @ROLE);
IF @User_exists > 0 THEN
IF @ROLE='Adm' THEN
	select d.DentistID, d.FirstName, d.LastName, sum(BillingAmt) as TotEarning from billinginfo as b join appointmentdetails as a 
	on b.AppID=a.AppID join dentist as d on d.DentistID = a.DentistID
	group by(DentistID);
ELSE 
	SET @message_text = ('User not authorized');
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
END IF;
END IF;
END$$
DELIMITER ;

-- All authorized users can see all dentists 
 	DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllDentists`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
CALL `bitein`.`UserAuth`(@USERNAME, @PASS, @ROLE);
IF @User_exists > 0 THEN
	SELECT *FROM BITEIN.DENTIST;
ELSE 
	SET @message_text = ('User not authorized');
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
END IF;
END$$
DELIMITER ;

-- Patient and Receptionits can see all pharmacies
 	DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPharmacies`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
CALL `bitein`.`UserAuth`(@USERNAME, @PASS, @ROLE);
IF @User_exists > 0 THEN
IF @ROLE='R' OR 'P' THEN
	SELECT *FROM BITEIN.PHARMACY;
ELSE 
	SET @message_text = ('User not authorized');
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
END IF;
END IF;
END$$
DELIMITER ;

-- Admin can see all dentist earnings
 	DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `HighestEarningDentist`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
CALL `bitein`.`UserAuth`(@USERNAME, @PASS, @ROLE);
IF @User_exists > 0 THEN
IF @ROLE='Adm' THEN
	select d.DentistID, d.FirstName, d.LastName, sum(BillingAmt) as TotEarning from billinginfo as b join appointmentdetails as a 
	on b.AppID=a.AppID join dentist as d on d.DentistID = a.DentistID
	group by(DentistID) order by TotEarning DESC;
ELSE 
	SET @message_text = ('User not authorized');
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
END IF;
END IF;	
END$$
DELIMITER ;


-- Only Dentist can see patient issue details
 	DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PatientsWithWornFillings`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
CALL `bitein`.`UserAuth`(@USERNAME, @PASS, @ROLE);
IF @User_exists > 0 THEN
IF @ROLE='D' THEN
	select distinct FirstName, LastName, SymptomName, DentistID from patient as p join prescription as pr
	on p.PatientID=pr.PatientID join symptom s on s.SymptomID=pr.SymptomID
	where SymptomName='worn fillings'
	group by(dentistID);
ELSE 
	SET @message_text = ('User not authorized');
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
END IF;
END IF;
END$$
DELIMITER ;

-- Admin and Receptionist can see patient visits and frequency of their visits
 	DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PatientVisitFrequency`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
CALL `bitein`.`UserAuth`(@USERNAME, @PASS, @ROLE);
IF @User_exists > 0 THEN
IF @ROLE='R' OR @ROLE='Adm' THEN
	select count(AppID) as TotAppointments, p.patientID, FirstName, LastName 
	from appointmentdetails a join patient p on a.patientID=p.PatientID
	group by(patientID) order by TotAppointments DESC;
ELSE
	SET @message_text = ('User not authorized');
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
END IF;
END IF;	
END$$
DELIMITER ;


-- Only Dentist can see dentist workload
 	DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `WorkLoad`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
CALL `bitein`.`UserAuth`(@USERNAME, @PASS, @ROLE);
IF @User_exists > 0 THEN
IF @ROLE='D' THEN
	select count(AppID) as TotAppointments, DentistID from appointmentdetails
	group by(DentistID) order by TotAppointments ASC;
ELSE
	SET @message_text = ('User not authorized');
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
END IF;
END IF;	
END$$
DELIMITER ;

--- only to the pharmacist
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `MedicinLog`(IN `USERNAME` VARCHAR(64), IN `PASS` VARCHAR(20), IN `ROLE` VARCHAR(5))
BEGIN
CALL `bitein`.`UserAuth`(@USERNAME, @PASS, @ROLE);
IF @User_exists > 0 THEN
IF @ROLE='Ph' THEN
	SELECT PrescID, PatientID, p.MedicineID, MedicineQty, m.MedicineName, Manufacturer, ExpiryDate 
	FROM 
	Medicine m JOIN prescription p 
	ON m.medicineID=p.medicineID
ELSE
	SET @message_text = ('User not authorized');
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message_text;
END IF;
END IF;	
END$$
DELIMITER ;


