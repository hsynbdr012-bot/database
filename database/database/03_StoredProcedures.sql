USE DoorERP;
GO

/* ==========================================
   Stored Procedures - DoorERP
   ========================================== */

-------------------------------------------------------
-- Add Customer
-------------------------------------------------------
CREATE PROCEDURE sp_AddCustomer
(
    @CustomerName NVARCHAR(200),
    @CompanyName NVARCHAR(200),
    @Phone NVARCHAR(50),
    @Email NVARCHAR(200),
    @Address NVARCHAR(500),
    @City NVARCHAR(100),
    @Country NVARCHAR(100)
)
AS
BEGIN

SET NOCOUNT ON;

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
(
    @CustomerName,
    @CompanyName,
    @Phone,
    @Email,
    @Address,
    @City,
    @Country
);

SELECT SCOPE_IDENTITY() AS CustomerId;

END
GO

-------------------------------------------------------
-- Get Customers
-------------------------------------------------------
CREATE PROCEDURE sp_GetCustomers
AS
BEGIN

SET NOCOUNT ON;

SELECT *
FROM Customers
WHERE IsActive = 1
ORDER BY CustomerName;

END
GO

-------------------------------------------------------
-- Add Quotation
-------------------------------------------------------
CREATE PROCEDURE sp_AddQuotation
(
    @CustomerId INT,
    @Discount DECIMAL(18,2),
    @VAT DECIMAL(18,2),
    @GrandTotal DECIMAL(18,2)
)
AS
BEGIN

SET NOCOUNT ON;

INSERT INTO Quotations
(
    CustomerId,
    QuotationDate,
    Total,
    Discount,
    VAT,
    GrandTotal,
    Status
)
VALUES
(
    @CustomerId,
    GETDATE(),
    @GrandTotal,
    @Discount,
    @VAT,
    @GrandTotal,
    'Draft'
);

SELECT SCOPE_IDENTITY() AS QuotationId;

END
GO

-------------------------------------------------------
-- Create Order
-------------------------------------------------------
CREATE PROCEDURE sp_CreateOrder
(
    @QuotationId INT,
    @OrderNumber NVARCHAR(50),
    @ExpectedDelivery DATETIME
)
AS
BEGIN

SET NOCOUNT ON;

INSERT INTO Orders
(
    QuotationId,
    OrderNumber,
    OrderDate,
    Status,
    ExpectedDelivery
)
VALUES
(
    @QuotationId,
    @OrderNumber,
    GETDATE(),
    'New',
    @ExpectedDelivery
);

SELECT SCOPE_IDENTITY() AS OrderId;

END
GO

-------------------------------------------------------
-- Update Order Status
-------------------------------------------------------
CREATE PROCEDURE sp_UpdateOrderStatus
(
    @OrderId INT,
    @Status NVARCHAR(100),
    @Notes NVARCHAR(MAX),
    @UpdatedBy NVARCHAR(100)
)
AS
BEGIN

SET NOCOUNT ON;

UPDATE Orders
SET Status = @Status
WHERE OrderId = @OrderId;

INSERT INTO OrderTracking
(
    OrderId,
    Stage,
    Notes,
    UpdatedBy
)
VALUES
(
    @OrderId,
    @Status,
    @Notes,
    @UpdatedBy
);

END
GO

-------------------------------------------------------
-- Search Doors
-------------------------------------------------------
CREATE PROCEDURE sp_SearchDoors
(
    @Keyword NVARCHAR(200)
)
AS
BEGIN

SET NOCOUNT ON;

SELECT
DoorId,
DoorName,
ModelNumber,
BasePrice
FROM Doors
WHERE DoorName LIKE '%' + @Keyword + '%'
OR ModelNumber LIKE '%' + @Keyword + '%';

END
GO
