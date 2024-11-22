
# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          CarDealershipDatabase                           #
# ---------------------------------------------------------------------- #



DROP DATABASE IF EXISTS cardealership;


CREATE DATABASE IF NOT EXISTS cardealership;

USE cardealership;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "Dealerships"                                                #
# ---------------------------------------------------------------------- #



CREATE TABLE `Dealerships` (
	`DealershipID` INT NOT NULL AUTO_INCREMENT, 
    `Name` VARCHAR(50),
    `Address` VARCHAR(50), 
    `Phone` VARCHAR(12),
    CONSTRAINT `PK_Dealership` PRIMARY KEY (`DealershipID`) 
    );
    
# ---------------------------------------------------------------------- #
# Add table "Vehicles"                                                   #
# ---------------------------------------------------------------------- #
    
    
    CREATE TABLE `Vehicles` (
    `VIN` VARCHAR(20) NOT NULL,
    `Make` VARCHAR(50) NOT NULL,
    `Model` VARCHAR(50) NOT NULL,
    `Year` INT NOT NULL,
    `Color` VARCHAR(30),
    `Sold` BOOLEAN DEFAULT FALSE,
	PRIMARY KEY (VIN)
    );
    
# ---------------------------------------------------------------------- #
# Add table "Inventory"                                                  #
# ---------------------------------------------------------------------- #
    
    
CREATE TABLE `Inventory` (
`DealershipID` INT NOT NULL,
`VIN` VARCHAR(20) NOT NULL
);

# ---------------------------------------------------------------------- #
# Add table "SalesContracts"                                             #
# ---------------------------------------------------------------------- #



CREATE TABLE `SalesContracts` (
`ContractID` INT NOT NULL AUTO_INCREMENT,
`BuyerName` VARCHAR(50) NOT NULL,
`BuyerContact` VARCHAR(50),
`SalePrice` DECIMAL(10, 2) NOT NULL,
`PaymentTerms` TEXT,
`ContractDate` DATE NOT NULL,
`PaymentStatus` VARCHAR(20) DEFAULT 'Pending',
`ContractStatus` VARCHAR(20) DEFAULT 'Active',
`SoldBy` VARCHAR(40), 
`VIN` VARCHAR(20) NOT NULL,
PRIMARY KEY (ContractID),
FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);


# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #



INSERT INTO `Dealerships` (`Name`, `Address`, `Phone`) VALUES
('Howdy Cars', '123 Speed Ave, Los Angeles, CA', '555-1010'),
('Elite Motors', '456 Turbo St, San Francisco, CA', '555-2020'),
('Luxury Wheels', '789 Racer Blvd, San Diego, CA', '555-3030'),
('Fast Lane Autos', '321 Velocity Rd, Irvine, CA', '555-4040'),
('Classic Car Sales', '654 Retro Dr, San Jose, CA', '555-5050');

# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #


INSERT INTO `Vehicles` (`Make`, `Model`, `Year`, `Color`, `VIN`, `Sold`) VALUES
('Toyota', 'Supra', 1994, 'Red', 'JZA80SUPRA1994', FALSE), 
('Nissan', 'Skyline GT-R', 1999, 'Black', 'RB26SKYLINE1999', FALSE), 
('Honda', 'Integra Type R', 1997, 'White', 'DC2INTEGRA1997', FALSE), 
('Mazda', 'RX-7', 1992, 'Silver', 'FD3SRX71992', TRUE), 
('Mitsubishi', 'Eclipse GSX', 1995, 'Blue', 'ECLIPSEGSX1995', FALSE), 
('Ford', 'Mustang GT', 1995, 'Yellow', '5.0MUSTANG1995', TRUE), 
('Chevrolet', 'Camaro Z28', 1994, 'Red', 'CAMAROZ281994', FALSE), 
('Dodge', 'Charger R/T', 1999, 'Black', 'RTCHARGER1999', FALSE), 
('Pontiac', 'Trans Am', 1998, 'White', 'TRANSTAM1998', FALSE), 
('Chevrolet', 'Chevelle SS', 1969, 'Blue', 'CHEVELLESS1969', TRUE);


# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #


INSERT INTO `Inventory` (`DealershipID`, `VIN`) VALUES
(1, 'JZA80SUPRA1994'),
(1, 'RB26SKYLINE1999'),
(2, 'DC2INTEGRA1997'),
(2, 'FD3SRX71992'),
(3, 'ECLIPSEGSX1995'),
(3, '5.0MUSTANG1995'),
(4, 'CAMAROZ281994'),
(4, 'RTCHARGER1999'),
(5, 'TRANSTAM1998'),
(5, 'CHEVELLESS1969');


# ---------------------------------------------------------------------- #
# Add info into "SalesContracts"                                         #
# ---------------------------------------------------------------------- #


INSERT INTO `SalesContracts` (`BuyerName`, `BuyerContact`, `SalePrice`, `PaymentTerms`, `ContractDate`, `PaymentStatus`, `ContractStatus`, `SoldBy`, `VIN`) VALUES
('Mike Johnson', '555-1122', 35000.00, '30% down payment, 36-month installments', '2024-10-15', 'Pending', 'Active', 'James Smith', 'JZA80SUPRA1994'),
('Alex Harris', '555-3344', 25000.00, 'Full payment upfront', '2024-10-20', 'Paid', 'Active', 'Sarah White', 'RB26SKYLINE1999'),
('Sarah Lee', '555-5566', 15000.00, '50% upfront, balance due in 12 months', '2024-10-25', 'Pending', 'Completed', 'Chris Black', 'CAMAROZ281994');









    
    