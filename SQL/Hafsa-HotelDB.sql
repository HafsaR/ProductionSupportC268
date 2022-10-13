-- Drop database is exist
DROP DATABASE IF EXISTS HotelReservation;

CREATE DATABASE HotelReservation;

USE HotelReservation;

CREATE TABLE Address(
	AddressId INT auto_increment NOT NULL PRIMARY KEY,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(20) NOT NULL,
    State VARCHAR(20) NOT NULL,
    ZIP VARCHAR(10) NOT NULL, 
    Phone VARCHAR(15)
);

CREATE TABLE Guest(
	GuestId INT auto_increment NOT NULL PRIMARY KEY,
    FirstNAme VARCHAR(15) NOT NULL,
    LastName VARCHAR(20) NOT NULL
);


CREATE TABLE Amenity(
	AmenityId INT auto_increment NOT NULL PRIMARY KEY,
    AmenityName VARCHAR(50) NOT NULL

);

CREATE TABLE Room (
RoomId INT NOT NULL PRIMARY KEY,
BasePrice DOUBLE NOT NULL
);

CREATE TABLE Description(
	DescriptionId INT auto_increment NOT NULL PRIMARY KEY,
    TypeName VARCHAR(15) NOT NULL,
    StandardOcc INT NOT NULL,
    MaxOcc INT NOT NULL,
   ADA_Accessible VARCHAR(10) NOT NULL
);

CREATE TABLE RoomAmenity(
	RoomId INT NOT NULL,
    AmenityId INT NOT NULL,
    PRIMARY KEY (RoomId, AmenityId),
	FOREIGN KEY fk_RoomAmenity_room(RoomId) 
		REFERENCES Room(RoomId),
    FOREIGN KEY fk_RoomAmenity_amenity (AmenityId) 
		REFERENCES Amenity(AmenityId)
);

CREATE TABLE RoomDescription(
	RoomId INT NOT NULL,
    DescriptionId INT NOT NULL,
    PRIMARY KEY (RoomId, DescriptionId),
	FOREIGN KEY fk_RoomAmenity_room(RoomId) 
		REFERENCES Room(RoomId),
    FOREIGN KEY fk_RoomDescription_description (DescriptionId) 
		REFERENCES Description(DescriptionId)
);


CREATE TABLE Reservation(
	ReservationId INT auto_increment NOT NULL PRIMARY KEY,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalPrice DOUBLE NOT NULL,
    Adult INT NOT NULL,
    Children INT
);



CREATE TABLE GuestRoomReservation(
	RoomId INT NOT NULL,
    GuestId INT NOT NULL,
    ReservationId INT NOT NULL,
    PRIMARY KEY (RoomId, GuestId, ReservationId),
	FOREIGN KEY fk_guestroom_guest(GuestId) 
		REFERENCES Guest(GuestId),
    FOREIGN KEY fk_guestroom_room (RoomId) 
		REFERENCES Room(RoomId),
	FOREIGN KEY fk_guestroom_reservation (ReservationId) 
		REFERENCES Reservation(ReservationId)
);


ALTER TABLE Address 
ADD COLUMN (GuestId INT NOT NULL),
ADD CONSTRAINT
 FOREIGN KEY fk_address_guest (GuestId)
		REFERENCES Guest(GuestId);


        
        


