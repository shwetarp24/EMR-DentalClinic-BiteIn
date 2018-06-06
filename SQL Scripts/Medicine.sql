CREATE TABLE biteinclinic.Medicine(
MedicineID varchar(20) PRIMARY KEY,
MedicineName varchar(20),
ManufacturerID varchar(20),
CONSTRAINT FK_ManuID FOREIGN KEY (ManufacturerID)
REFERENCES Manufacturer(ManufacturerID)
)