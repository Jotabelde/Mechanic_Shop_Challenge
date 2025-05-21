CREATE schema IF NOT EXISTS Mechanic_Shop; 
use Mechanic_Shop;

#Customer Table
CREATE TABLE IF NOT EXISTS Customers( 
	id_Customer INT PRIMARY KEY AUTO_INCREMENT,	
	Name VARCHAR(100),
	Phone VARCHAR(20), 
	CPF VARCHAR(14) UNIQUE
);

#Vehicle Table
CREATE TABLE IF NOT EXISTS Vehicles (
    id_Vehicle INT PRIMARY KEY AUTO_INCREMENT,
    id_Customer INT,
    Plate VARCHAR(10) UNIQUE,
    Model VARCHAR(50),
    Ano VARCHAR(5),
    Cor VARCHAR(10),
    FOREIGN KEY (id_Customer) REFERENCES Customers (id_Customer)
);

#EMPLOYEE TABLE
CREATE TABLE IF NOT EXISTS Employees(
	id_Employee INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    CPF VARCHAR(14) UNIQUE,
    Address VARCHAR(150),
    Expertise VARCHAR(50)
);

#Table Team
CREATE TABLE IF NOT EXISTS Teams (
    id_Team INT PRIMARY KEY AUTO_INCREMENT
);

#Table Parts
CREATE TABLE IF NOT EXISTS Parts(
	id_Part INT PRIMARY KEY AUTO_INCREMENT,
    Valor DECIMAL(10,2)
);

#Table Service
CREATE TABLE IF NOT EXISTS Services(
	id_Service INT PRIMARY KEY AUTO_INCREMENT,
    Valor DECIMAL(10,2),
    Type VARCHAR (50)
);

#Table Order_of_Service
CREATE TABLE IF NOT EXISTS Order_of_Services(
	id_Order_of_Service INT PRIMARY KEY AUTO_INCREMENT,
    id_Vehicle INT,
    Issue_Data DATETIME,
    End_Data DATETIME,
    Status ENUM('Aberta', 'Pendente', 'Concluída'),
    id_Team INT,
    FOREIGN KEY (id_Team) REFERENCES Teams(id_Team),
    FOREIGN KEY (id_Vehicle) REFERENCES Vehicles(id_Vehicle)
);


# Table Service_OS
CREATE TABLE IF NOT EXISTS Service_OS(
	id_Order_of_Service INT,
    id_Service INT,
    Hours TIME,
    PRIMARY KEY (id_Order_of_Service, id_Service),
    FOREIGN KEY (id_Order_of_Service) REFERENCES Order_of_Services(id_Order_of_Service),
    FOREIGN KEY (id_Service) REFERENCES Services(id_Service)
);

# Table PARTS_OS
CREATE TABLE IF NOT EXISTS Parts_OS(
	id_Order_of_Service INT,
    id_Part INT,
    Amount INT,
    PRIMARY KEY (id_Order_of_Service, id_Part),
    FOREIGN KEY (id_Order_of_Service) REFERENCES Order_of_Services(id_Order_of_Service),
    FOREIGN KEY (id_Part) REFERENCES Parts(id_Part)
);

# Table Team
CREATE TABLE IF NOT EXISTS Employee_Team(
	id_Team INT,
    id_Employee INT,
    PRIMARY KEY (id_Employee, id_Team),
    FOREIGN KEY (id_Team) REFERENCES Teams(id_Team),
    FOREIGN KEY (id_Employee) REFERENCES Employees(id_Employee)
);

#Table Order_Autorization
CREATE TABLE IF NOT EXISTS Orders_Authorization(
	id_Customer INT,
    id_Order_of_Service INT,
    Autorization BOOLEAN,
    PRIMARY KEY (id_Customer, id_Order_of_Service),
    FOREIGN KEY (id_Order_of_Service) REFERENCES Order_of_Services(id_Order_of_Service),
	FOREIGN KEY (id_Customer) REFERENCES Customers(id_Customer)
);
