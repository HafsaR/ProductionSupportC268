USE HotelReservation;

/*
1. Write a query that returns a list of reservations that end in July 2023,
 including the name of the guest, the room number(s), and the reservation dates.
-- 4 row
*/

SELECT 
	CONCAT(Guest.FirstNAme,' ', Guest.LastName) as GuestName,
    Room.RoomId,
    Reservation.StartDate,
    Reservation.EndDate
FROM Reservation 
JOIN GuestRoomReservation ON GuestRoomReservation.ReservationId = Reservation.ReservationId
JOIN Guest ON Guest.GuestId = GuestRoomReservation.GuestId
JOIN Room ON Room.RoomId = GuestRoomReservation.RoomId
WHERE Reservation.EndDate BETWEEN '2023-07-01' AND '2023-07-31'
 ;

/*
2. Write a query that returns a list of all reservations for rooms with a jacuzzi, 
displaying the guest's name, the room number, and the dates of the reservation.
-- 11 rows
*/
SELECT 
	CONCAT(Guest.FirstNAme,' ', Guest.LastName) as GuestName,
    Room.RoomId,
    Reservation.StartDate,
    Reservation.EndDate,
    Amenity.AmenityName
FROM Reservation 
JOIN GuestRoomReservation ON GuestRoomReservation.ReservationId = Reservation.ReservationId
JOIN Guest ON Guest.GuestId = GuestRoomReservation.GuestId
JOIN Room ON Room.RoomId = GuestRoomReservation.RoomId
JOIN RoomAmenity ON RoomAmenity.RoomId = Room.RoomId
JOIN Amenity ON Amenity.AmenityId = RoomAmenity.AmenityId
WHERE Amenity.AmenityId = 4
;

/*
3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved,
 the starting date of the reservation,
 and how many people were included in the reservation. (Choose a guest's name from the existing data.)
 -- 2 rows
*/
SELECT 
	CONCAT(Guest.FirstNAme,' ', Guest.LastName) as GuestName,
    Room.RoomId,
    Reservation.StartDate,
    Reservation.EndDate
FROM Reservation 
JOIN GuestRoomReservation ON GuestRoomReservation.ReservationId = Reservation.ReservationId
JOIN Guest ON Guest.GuestId = GuestRoomReservation.GuestId
JOIN Room ON Room.RoomId = GuestRoomReservation.RoomId
WHERE Guest.FirstNAme = 'Hafsa' AND Guest.LastName = 'Degmaster'
 ;
 
 /*
 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
 The results should include all rooms, whether or not there is a reservation associated with the room.
 -- 27 rows
 */
 
 SELECT 
	 Room.RoomId,
	 Reservation.ReservationId,
	 Room.BasePrice
 FROM Room 
 LEFT JOIN GuestRoomReservation ON GuestRoomReservation.RoomId = Room.RoomId
 LEFT JOIN Reservation ON Reservation.ReservationId = GuestRoomReservation.ReservationId;
 
 /*
 5. Write a query that returns all the rooms accommodating at least three guests and that are 
 reserved on any date in April 2023.
  -- 0 rows
 */
 
 SELECT 
	 Room.RoomId,
	 Reservation.ReservationId,
	 Room.BasePrice,
     SUM(Reservation.Adult + Reservation.Children) as total
 FROM Room 
JOIN GuestRoomReservation ON GuestRoomReservation.RoomId = Room.RoomId
JOIN Reservation ON Reservation.ReservationId = GuestRoomReservation.ReservationId
WHERE Reservation.EndDate between '2023-04-01' AND '2023-04-30'
GROUP BY
	 Room.RoomId, 
	Reservation.ReservationId,
	Room.BasePrice
HAVING total >= 3;

/*
6. Write a query that returns a list of all guest names and the number of reservations per guest,
 sorted starting with the guest with the most reservations and then by the guest's last name.
 -- 12 rows
*/
 SELECT 
	CONCAT(Guest.FirstNAme, ' ', Guest.LastName) as GuestName,
    COUNT(*) as reservationNumber
 FROM Guest
 LEFT JOIN GuestRoomReservation USING(GuestId)
 LEFT JOIN Reservation USING (ReservationId)
 GROUP BY GuestName, Guest.LastName 
 ORDER BY reservationNumber DESC, Guest.LastName;
 
/*
7. Write a query that displays the name, address, 
and phone number of a guest based on their phone number.
 (Choose a phone number from the existing data.)
 
 1 row
*/

SELECT 
	CONCAT(Guest.FirstNAme, ' ', Guest.LastName) as GuestName,
	Address.Address,
	Address.Phone
FROM Guest
JOIN Address USING (GuestId)
WHERE Address.Phone = '(308)-494-0198'
;


 
 
