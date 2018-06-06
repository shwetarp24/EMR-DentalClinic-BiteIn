CREATE TABLE biteinclinic.Supplies
(ManufacturerID varchar(20),
PharmID varchar(20),
SupplyAmt int,
CONSTRAINT FK_ManuuffID FOREIGN KEY (ManufacturerID)
references Manufacturer(ManufacturerID),
CONSTRAINT FK_PharmmID FOREIGN KEY (PharmID)
references Pharmacy(PharmID)
)