-- Step 1: Drop the database if it exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'EventEaseDB')
BEGIN
    ALTER DATABASE EventEaseDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE EventEaseDB;
END
GO

-- Step 2: Create the database
CREATE DATABASE EventEaseDB;
GO

USE EventEaseDB;
GO

-- Step 3: Create a sequence for generating IDs
CREATE SEQUENCE VenueSeq AS INT START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE EventSeq AS INT START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE BookingSeq AS INT START WITH 1 INCREMENT BY 1;
GO

-- Step 4: Create the Venue table (Fix: Store VenueId as a column, not computed)
CREATE TABLE Venue (
    Id INT IDENTITY(1,1) PRIMARY KEY,  
    VenueId NVARCHAR(4) UNIQUE NOT NULL,  -- Now explicitly stored, not computed
    VenueName NVARCHAR(255) NOT NULL,
    Location NVARCHAR(255) NOT NULL,
    Capacity INT NOT NULL,
    ImageURL NVARCHAR(500) NOT NULL
);
GO

-- Step 5: Create the Event table (Fix: Ensure VenueId is consistent)
CREATE TABLE Event (
    Id INT IDENTITY(1,1) PRIMARY KEY,  
    EventId NVARCHAR(4) UNIQUE NOT NULL,
    EventName NVARCHAR(255) NOT NULL,
    EventDate DATETIME NOT NULL,
    Description NVARCHAR(1000),
    VenueId NVARCHAR(4) NULL,
    FOREIGN KEY (VenueId) REFERENCES Venue(VenueId) ON DELETE SET NULL
);
GO

-- Step 6: Create the Booking table (Fix: Ensure EventId references Event correctly)
CREATE TABLE Booking (
    Id INT IDENTITY(1,1) PRIMARY KEY,  
    BookingId NVARCHAR(4) UNIQUE NOT NULL,
    EventId NVARCHAR(4) NOT NULL,
    VenueId NVARCHAR(4) NOT NULL,
    BookingDate DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (EventId) REFERENCES Event(EventId) ON DELETE CASCADE,
    FOREIGN KEY (VenueId) REFERENCES Venue(VenueId) ON DELETE CASCADE
);
GO

-- Step 7: Insert sample venues (Fix: Generate VenueId manually)
INSERT INTO Venue (VenueId, VenueName, Location, Capacity, ImageURL) 
VALUES
('V001', 'FNB Stadium', 'Johannesburg, Gauteng', 94736, 'https://via.placeholder.com/150'),
('V002', 'Moses Mabhida Stadium', 'Durban, KwaZulu-Natal', 55000, 'https://via.placeholder.com/150'),
('V003', 'Cape Town Stadium', 'Cape Town, Western Cape', 55000, 'https://via.placeholder.com/150'),
('V004', 'Nelson Mandela Bay Stadium', 'Port Elizabeth, Eastern Cape', 46000, 'https://via.placeholder.com/150'),
('V005', 'Free State Stadium', 'Bloemfontein, Free State', 36000, 'https://via.placeholder.com/150');
GO

-- Step 8: Check Data
SELECT * FROM Venue;
SELECT * FROM Event;
SELECT * FROM Booking;
GO



-- Insert sample events (Make sure the VenueId exists in the Venue table)
INSERT INTO Event (EventId, EventName, EventDate, Description, VenueId) 
VALUES
('E001', 'Rock Concert', '2025-06-15 19:00:00', 'A thrilling rock concert featuring top bands.', 'V001'),
('E002', 'Tech Conference', '2025-07-20 09:00:00', 'Annual technology conference with keynote speakers.', 'V002'),
('E003', 'Football Match', '2025-08-05 15:00:00', 'Exciting football match between top teams.', 'V003');
GO

-- Insert sample bookings (Make sure the EventId and VenueId exist in respective tables)
INSERT INTO Booking (BookingId, EventId, VenueId, BookingDate)
VALUES
('B001', 'E001', 'V001', GETDATE()),
('B002', 'E002', 'V002', GETDATE()),
('B003', 'E003', 'V003', GETDATE());
GO

-- Check if the Event table has data
SELECT * FROM Event;
GO

-- Check if the Booking table has data
SELECT * FROM Booking;
GO
