use lagos_ride;
CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 2),
    TotalRides INT default 0
);

CREATE TABLE Riders (
    RiderID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL
);

CREATE TABLE Rides (
    RideID INT PRIMARY KEY,
    DriverID INT,
    RiderID INT,
    Fare DECIMAL(10, 2) NOT NULL,
    Rating DECIMAL(3, 2),
    DistanceKM DECIMAL(5, 2),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID),
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    RideID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (RideID) REFERENCES Rides(RideID)
);

