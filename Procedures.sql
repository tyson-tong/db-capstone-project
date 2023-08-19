CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity) AS "Max Quantity in Order"
FROM littlelemondb.order;

DELIMITER //
CREATE PROCEDURE AddBooking(BookingId INT, CustomerId INT, BookingDate DATE, TableNumber INT)
BEGIN
    INSERT INTO littlelemondb.booking (BookingId, CustomerId, BookingDate, TableNumber)
    VALUES (BookingId, CustomerId, BookingDate, TableNumber);
    SELECT "New booking added" AS Confirmation;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateBooking(BookingId INT, BookingDate DATE)
BEGIN
    UPDATE littlelemondb.booking SET BookingDate = BookingDate WHERE BookingId = BookingId;
    SELECT CONCAT("Booking ", BookingId, " updated") AS Confirmation;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CancelBooking(BookingId INT)
    DELETE FROM littlelemondb.booking WHERE BookingId = BookingId;
    SELECT CONCAT("Booking ", BookingId, " cancelled") AS Confirmation;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ManageBooking(TableNumber INT, CustomerId INT, BookingDate DATE)
BEGIN
    IF EXISTS (SELECT * FROM littlelemondb.booking WHERE TableNumber = TableNumber AND CustomerId = CustomerId AND BookingDate = BookingDate)
    THEN SELECT CONCAT("The booking for table ", TableNumber, " has failed.") AS Confirmation;
    ELSE
        INSERT INTO littlelemondb.booking (CustomerId, BookingDate, TableNumber)
        VALUES (CustomerId, BookingDate, TableNumber);
        SELECT "New booking added" AS Confirmation;
    END IF;
END //
DELIMITER ;