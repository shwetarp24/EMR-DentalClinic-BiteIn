/*For S03=worn fillings - How many times has a patient come with worn fillings and got treated till now?*/
select distinct FirstName, LastName, SymptomName, DentistID from patient as p join prescription as pr
on p.PatientID=pr.PatientID join symptom s on s.SymptomID=pr.SymptomID
where SymptomName='worn fillings'
group by(dentistID);

/*List of dentists and their earnings per appointment*/
select d.DentistID, d.FirstName, d.LastName, BillingAmt /*as TotEarning*/ from billinginfo as b join appointmentdetails as a 
on b.AppID=a.AppID join dentist as d on d.DentistID = a.DentistID;

/*highest earning dentist*/
select d.DentistID, d.FirstName, d.LastName, sum(BillingAmt) as TotEarning from billinginfo as b join appointmentdetails as a 
on b.AppID=a.AppID join dentist as d on d.DentistID = a.DentistID
group by(DentistID) order by TotEarning DESC;

/*Number of appointments handled each day*/
select count(AppID), Appdate as Dates, DentistID from appointmentdetails
group by(appdate) order by Appdate ASC;

/*Workload of each dentist*/
select count(AppID) as TotAppointments, DentistID from appointmentdetails
group by(DentistID) order by TotAppointments ASC;

/*Number of visis each patient makes to the clinic*/
select count(AppID) as TotAppointments, p.patientID, FirstName, LastName 
from appointmentdetails a join patient p on a.patientID=p.PatientID
group by(patientID) order by TotAppointments DESC;

/*Balance due by patients*/
select patientID, PayMode, Paydate, PayAmt, Balance from billinginfo b join payment p 
on p.ReceiptID = b.ReceiptID 

