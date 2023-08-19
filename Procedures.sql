CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity)
FROM littlelemondb.order;

CREATE PROCEDURE AddBooking(BookingId INT, CustomerId INT, BookingDate DATE, TableNumber INT)
INSERT INTO littlelemondb.booking (BookingId, CustomerId, BookingDate, TableNumber)
VALUES (BookingId, CustomerId, BookingDate, TableNumber);

CREATE PROCEDURE UpdateBooking(BookingId INT, BookingDate DATE)
UPDATE littlelemondb.booking SET BookingDate = BookingDate WHERE BookingId = BookingId;

CREATE PROCEDURE CancelBooking(BookingId INT)
DELETE FROM littlelemondb.booking WHERE BookingId = BookingId;