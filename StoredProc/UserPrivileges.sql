-- USER ROLES:
1.Admin
2.Receptionist - 
	Insurance(update),
	AppointmentDetails(select, insert, update, delete)
3.Dentist - 
	MedHistory(select, insert,update),
	Symptom(select, insert, update), 
	Prescription(select, insert, update, delete)
4.Patient - 
	Patient(select, insert, update, delete), 
	MedHistory(select, insert,update)
5.Pharmacist - 
	Medicine(select, insert, update, delete),
	Precription(select),
	Patient(select), 
	VisitingDetails(select)
*/


CREATE USER AdmShweta@localhost IDENTIFIED BY 'bitein';
CREATE USER RecLily IDENTIFIED BY 'bitein';
CREATE USER PatBen IDENTIFIED BY 'bitein';
CREATE USER PharmJoe IDENTIFIED BY 'bitein';
CREATE USER DenRoss IDENTIFIED BY 'bitein';


GRANT ALL ON bitein.* TO AdmShweta IDENTIFIED BY 'bitein' WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON bitein.AppointmentDetails TO RecLily;
GRANT SELECT, INSERT, UPDATE, DELETE ON bitein.Prescription TO DenRoss;
GRANT SELECT, INSERT, UPDATE, DELETE ON bitein.Patient TO PatBen;
GRANT SELECT, INSERT, UPDATE, DELETE ON bitein.Medicine TO PharmJoe;
GRANT SELECT, INSERT, UPDATE ON bitein.MedHistory TO DenRoss;
GRANT SELECT, INSERT, UPDATE ON bitein.Symptom TO DenRoss;
GRANT SELECT, INSERT, UPDATE ON bitein.MedHistory TO PatBen;
GRANT SELECT, INSERT, UPDATE ON bitein.Insurance TO RecLily;
GRANT SELECT ON bitein.Prescription TO PharmJoe;
GRANT SELECT ON bitein.Patient TO PharmJoe;
GRANT SELECT(DentistID, PatientID, PrescID) ON bitein.VisitingDetails TO PharmJoe;
