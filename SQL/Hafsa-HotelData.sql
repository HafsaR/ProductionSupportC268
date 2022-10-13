USE HotelReservation;

SELECT * FROM HotelReservation.Room;


INSERT INTO Description (TypeName,StandardOcc,MaxOcc, ADA_Accessible) VALUES 
('Double', 2, 4,  'NO'),
('Double', 2, 4,  'YES'),
('Double', 2, 4,  'NO'),
('Double', 2, 4,  'YES'),
('Single', 2, 2,  'NO'),
('Single', 2, 2,  'YES'),
('Single', 2, 2,  'NO'),
('Single', 2, 2, 'YES'),
('Double', 2, 4,  'NO'),
('Double', 2, 4,  'YES'),
('Double', 2, 4,  'NO'),
('Double', 2, 4,  'YES'),
('Single', 2, 2,  'NO'),
('Single', 2, 2,  'YES'),
('Single', 2, 2,  'NO'),
('Single', 2, 2,  'YES'),
('Suite', 3, 8,  'YES'),
('Suite', 3, 8,  'YES')
;

DESC Description;

SELECT * FROM Description;

-- add data in amenity. table
INSERT INTO Amenity (AmenityName) VALUES 
('Microwave'),
('Oven'),
('Refridgerator'),
('Jacuzzi');

SELECT * FROM Amenity;

-- add data on guest table
INSERT INTO Guest (FirstNAme, LastName) VALUE
('Hafsa', 'Degmaster'),
('Mack', 'Simmer'),
('Bettyann', 'Seery'),
('Duane', 'Cullison'), 
('Karie', 'Yang'),
('Aurore', 'Lipton'), 
('Zachery', 'Luechtefeld'), 
('Jeremiah', 'Pendergrass'), 
('Walter', 'Holaway'),
('Wilfred', 'Vise'),
('Maritza', 'Tilton'),
('Joleen', 'Tison');

SELECT * FROM Guest;

INSERT INTO Address (Address, City, State, ZIP, Phone, GuestId) VALUES
	('3525- Avonhurst Dr', 'Regina', 'SK', 'S4R 3K2', '(xxx)-xxx-xxxx', 1),
	('379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '(291)-553-0508',2),
    ('750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '(478)-277-9632', 3),
    ('9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308)-494-0198', 4),
    ('9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '(214)-730-0298',5),
    ('762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377)-507-0974',6),
    ('7 Poplar Dr.', 'Arvada', 'CO', '80003', '(814)-485-2615',7),
    ('70 Oakwood St.', 'Zion', 'IL', '60099', '(279)-491-0960',8),
    ('7556 Arrowhead St.', 'Cumberland', 'RI','02864', '(446)-396-6785',9),
    ('77 West Surrey Street', 'Oswego', 'NY', '13126', '(834)-727-1001',10),
    ('939 Linda Rd', 'Burke', 'VA', '22015', '(446)-351-6860',11),
    ('87 Queen St.', 'Drexel Hill', 'PA', '19026', '(231)-893-2755',12);

SELECT * FROM Address;

DESC Address;

-- insert data in room 
INSERT INTO Room VALUE
(201, 199.99),
(202, 174.99),
(203, 199.99),
(204,174.99),
(205, 174.99),
(206, 149.99),
(207, 174.99),
(208, 149.99),
(301, 199.99),
(302, 174.99),
(303, 199.99),
(304, 174.99),
(305, 174.99),
(306, 149.99),
(307, 174.99),
(308, 149.99),
(401, 399.99),
(402, 399.99);

INSERT INTO RoomDescription VALUE
(201, 1),
(202, 2),
(203, 3),
(204, 4),
(205, 5),
(206, 6),
(207, 7),
(208, 8),
(301, 9),
(302, 10),
(303, 11),
(304, 12),
(305, 13),
(306, 14),
(307, 15),
(308, 16),
(401, 17),
(402, 18);


INSERT INTO RoomAmenity  VALUES 
(201,1),
(201,4),
(202,3),
(203,1),
(203,4),
(204,3),
(205,1),
(205,3),
(205,4),
(206,3),
(206,1),
(207,1),
(207,3),
(207,4),
(208,1),
(208,3),
(301,1),
(301,4),
(302,3),
(303,1),
(303,4),
(304,3),
(305,1),
(305,3),
(305,4),
(306,1),
(306,3),
(307,1),
(307,3),
(307,4),
(308,1),
(308,3),
(401,1),
(401,3),
(401,2),
(402,1),
(402,3),
(402,2);

SELECT * FROM Room;

-- insert data reservation 
INSERT INTO Reservation (StartDate, EndDate, TotalPrice, Adult, Children) VALUES
('2023-02-02', '2023-04-02', 299.98, 1, 0),
('2023-05-02', '2023-10-02', 999.95, 2, 1),
('2023-02-22', '2023-02-24', 349.98, 2, 0 ),
('2023-03-06', '2023-03-07', 199.99, 2, 2 ),
('2023-03-17', '2023-03-20', 524.97, 1, 1 ),
('2023-03-18', '2023-03-23', 924.95, 3, 0),
('2023-03-29', '2023-03-31', 349.98, 2, 2),
('2023-03-31', '2023-04-05', 874.95, 2, 0),
('2023-04-09', '2023-04-13', 799.96, 1, 0),
('2023-04-23', '2023-04-24', 174.99, 1, 1),
('2023-05-30', '2023-06-02', 1199.97, 2, 4),
('2023-06-10', '2023-06-14', 599.96, 2, 0),
('2023-06-10', '2023-06-14', 599.96,1,0),
('2023-06-17', '2023-06-18', 184.99,3,0),
('2023-06-28', '2023-07-02', 699.96,2,0),
('2023-07-13', '2023-07-14', 184.99,3,1),
('2023-07-18', '2023-07-21', 1259.97,4,2),
('2023-07-28', '2023-07-29', 199.99,2,1),
('2023-08-30', '2023-09-01', 349.98,1,0),
('2023-09-16', '2023-09-17', 149.99,2,0),
('2023-09-13', '2023-09-15', 399.98, 2, 2),
('2023-11-22', '2023-11-25', 1199.97, 2, 2),
('2023-11-22', '2023-11-25', 449.97, 2, 0),
('2023-11-22', '2023-11-25', 599.97, 2, 2),
('2023-12-24', '2023-12-28', 699.96, 2, 0);
       
    SELECT 
    COUNT(*)
FROM
    Reservation;
    
    
    INSERT INTO GuestRoomReservation VALUES 
    (308, 2, 1),
    (203, 3, 2),
    (305, 4, 3),
    (201, 5, 4),
    (307, 1, 5),
    (302, 6, 6),
    (202, 7, 7),
    (304, 8, 8),
    (301, 9, 9),
    (207, 10, 10),
    (401, 11, 11),
    (206, 12, 12),
    (208, 12, 13),
    (304, 6, 14),
    (205, 1, 15),
    (204, 9, 16),
    (401, 10, 17),
    (303, 3, 18),
    (305, 3, 19),
    (208, 2, 20),
    (203, 5, 21),
    (401, 4, 22),
    (206, 2, 23),
    (301, 2, 24),
    (302, 11, 25);
    
    SELECT 
    *
FROM
    Room;
    
SELECT 
    *
FROM
    Address;
     
SELECT 
    *
FROM
    Amenity;
      
SELECT 
    *
FROM
    Description;
       
SELECT 
    *
FROM
    Guest;
        
SELECT 
    *
FROM
    GuestRoomReservation;
SELECT 
    *
FROM
    Reservation;
SELECT 
    *
FROM
    RoomAmenity;
SELECT 
    *
FROM
    RoomDescription;
    
    
    
    
    
    
    
    
    

    
    









    
    
