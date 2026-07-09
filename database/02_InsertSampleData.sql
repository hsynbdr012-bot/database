USE DoorERP;

-------------------------------------------------
-- Door Categories
-------------------------------------------------

INSERT INTO DoorCategories (CategoryName, Description)
VALUES
('Wood Door', 'Natural wood doors'),
('WPC Door', 'Wood Plastic Composite'),
('PVC Door', 'PVC Interior Doors'),
('Steel Door', 'Steel Security Doors'),
('Aluminum Door', 'Aluminum Doors');

-------------------------------------------------
-- Doors
-------------------------------------------------

INSERT INTO Doors
(
    CategoryId,
    DoorName,
    ModelNumber,
    Width,
    Height,
    Thickness,
    BasePrice,
    Description,
    ImageUrl
)
VALUES
(1,'Classic Wood','WD-100',90,210,4.5,850,'Classic Wooden Door',''),
(2,'Modern WPC','WPC-200',90,210,4.0,950,'Premium WPC Door',''),
(3,'PVC White','PVC-300',90,210,3.5,650,'Interior PVC Door',''),
(4,'Steel Secure','ST-400',100,220,5.0,1800,'Security Steel Door',''),
(5,'Aluminum Glass','AL-500',100,220,4.0,1600,'Modern Aluminum Door','');

-------------------------------------------------
-- Customers
-------------------------------------------------

INSERT INTO Customers
(
    CustomerName,
    CompanyName,
    Phone,
    Email,
    Address,
    City,
    Country
)
VALUES
('Ahmed Ali','ABC Construction','0500000001','ahmed@test.com','Riyadh','Riyadh','Saudi Arabia'),
('Mohammed Saleh','Modern Homes','0500000002','m.saleh@test.com','Jeddah','Jeddah','Saudi Arabia'),
('Fahad Omar','Elite Villas','0500000003','fahad@test.com','Dammam','Dammam','Saudi Arabia');
