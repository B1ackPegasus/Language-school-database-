--Adress
CREATE TABLE Adress (
    Id INTEGER PRIMARY KEY,
    Street VARCHAR2(50) NOT NULL,
    City VARCHAR2(30) NOT NULL,
    Building_number INTEGER NOT NULL ,
    Appartment_numer INTEGER  NULL
);
--Student
CREATE TABLE Student (
    Id INTEGER PRIMARY KEY,
    First_name VARCHAR2(25) NOT NULL,
    Last_name VARCHAR2(25) NOT NULL,
    Date_of_birth DATE NOT NULL,
    Adress_Id INTEGER NOT NULL,
    FOREIGN KEY (Adress_Id) REFERENCES Adress (Id)
);
-- Table: Teacher
CREATE TABLE Teacher (
    Id INTEGER PRIMARY KEY,
    First_name VARCHAR2(25) NOT NULL,
    Last_name VARCHAR2(25) NOT NULL,
    Email VARCHAR2(30) NOT NULL,
    Phone VARCHAR2(15) NULL ,
    Adress_Id INTEGER NOT NULL,
    FOREIGN KEY (Adress_Id) REFERENCES Adress (Id)
);
--Language
CREATE TABLE Language (
    Id INTEGER PRIMARY KEY ,
    Language_name VARCHAR2(50) NOT NULL
);
--Level
CREATE TABLE "Level" (
    Id INTEGER PRIMARY KEY,
    Sign_level CHAR(2) NOT NULL,
    Name_level VARCHAR2(20) NOT NULL
);
--Teacher_level_language
CREATE TABLE Teacher_level_language (
    Teacher_Id INTEGER NOT NULL,
    Language_Id INTEGER NOT NULL,
    Level_Id INTEGER NOT NULL,
    PRIMARY KEY (Language_Id, Level_Id, Teacher_Id),
    FOREIGN KEY (Language_Id) REFERENCES Language (Id),
    FOREIGN KEY (Level_Id) REFERENCES "Level" (Id),
    FOREIGN KEY (Teacher_Id) REFERENCES Teacher (Id)
);
--Course
CREATE TABLE Course (
    Id INTEGER PRIMARY KEY,
    Lessons INTEGER NOT NULL,
    Description VARCHAR2(100) NULL ,
    Level_Id INTEGER NOT NULL,
    Language_Id INTEGER NOT NULL,
    FOREIGN KEY (Language_Id) REFERENCES Language (Id),
    FOREIGN KEY (Level_Id) REFERENCES "Level" (Id)
);
--Group
CREATE TABLE "Group" (
    Id INTEGER PRIMARY KEY,
    Name VARCHAR2(10) NOT NULL,
    Course_Id INTEGER NOT NULL,
    Teacher_Id INTEGER NOT NULL,
    FOREIGN KEY (Course_Id) REFERENCES Course (Id),
    FOREIGN KEY (Teacher_Id) REFERENCES Teacher (Id)
);
--Student_group
CREATE TABLE Student_group (
    Student_Id INTEGER NOT NULL,
    Group_Id INTEGER NOT NULL,
    PRIMARY KEY (Student_Id, Group_Id),
    FOREIGN KEY (Group_Id) REFERENCES "Group" (Id),
    FOREIGN KEY (Student_Id) REFERENCES Student (Id)
);
--Room
CREATE TABLE Room (
    Room_number INTEGER PRIMARY KEY ,
    Seats INTEGER NOT NULL
);
--Group_room
CREATE TABLE Group_room (
    Id INTEGER PRIMARY KEY,
    Room_number INTEGER NOT NULL ,
    Time_start TIMESTAMP  NOT NULL,
    Time_end TIMESTAMP  NOT NULL,
    Group_Id INTEGER NOT NULL,
    FOREIGN KEY (Group_Id) REFERENCES "Group" (Id),
    FOREIGN KEY (Room_number) REFERENCES Room (Room_number)
);
--Weekday
CREATE TABLE Weekday (
    Id INTEGER PRIMARY KEY,
    Name VARCHAR2(15) NOT NULL
);
--Day_group_room
CREATE TABLE Day_group_room (
    Group_room_Id INTEGER NOT NULL,
    Weekday_Id INTEGER NULL,
    PRIMARY KEY (Group_room_Id, Weekday_Id),
    FOREIGN KEY (Group_room_Id) REFERENCES Group_room (Id),
    FOREIGN KEY (Weekday_Id) REFERENCES Weekday (Id)
);
--Payment_method
CREATE TABLE Payment_method (
    Id INTEGER PRIMARY KEY,
    Type VARCHAR2(20) NOT NULL
);
--Payment
CREATE TABLE Payment (
    Id INTEGER PRIMARY KEY,
    "Date" DATE  NULL,
    Amount NUMBER(6,2) NOT NULL,
    Status SMALLINT NOT NULL,
    Payment_method_Id INTEGER  NULL,
    Student_Id INTEGER NOT NULL,
    Group_Id INTEGER NOT NULL,
    FOREIGN KEY (Group_Id) REFERENCES "Group" (Id),
    FOREIGN KEY (Payment_method_Id) REFERENCES Payment_method (Id),
    FOREIGN KEY (Student_Id) REFERENCES Student (Id)
);
 
-------------inserts-------
 
INSERT INTO Adress VALUES (1, 'Marsa Street', 'Warsaw', 12, 5);
INSERT INTO Adress VALUES (2, 'Marszałkowska Street', 'Warsaw', 34, 7);
INSERT INTO Adress VALUES (3, 'Miodowa Street', 'Warsaw', 56, 12);
INSERT INTO Adress VALUES (4, 'Mokotowska Street', 'Warsaw', 78, 3);
INSERT INTO Adress VALUES (5, 'Zlota Street', 'Warsaw', 44, 213);
INSERT INTO Adress VALUES (6, 'New World Street', 'Warsaw', 134, 8);
INSERT INTO Adress VALUES (7, 'Płaskowickiej Street', 'Warsaw', 178, 2);
INSERT INTO Adress VALUES (8, 'Puławska Street', 'Warsaw', 256, 7);
INSERT INTO Adress VALUES (9, 'Koszykowa Street', 'Warsaw', 290, 6);
INSERT INTO Adress VALUES (10, 'Twarda Street', 'Warsaw', 54, 7);
 
INSERT INTO Student VALUES (1, 'John', 'Doe', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO Student VALUES (2, 'Jane', 'Smith', TO_DATE('2004-05-20', 'YYYY-MM-DD'), 2);
INSERT INTO Student VALUES (3, 'Andrew', 'Shau', TO_DATE('1995-09-10', 'YYYY-MM-DD'), 3);
INSERT INTO Student VALUES (4, 'Emily', 'Johnson', TO_DATE('1999-03-25', 'YYYY-MM-DD'), 4);
INSERT INTO Student VALUES (5, 'Helena', 'Bohn', TO_DATE('2003-03-08', 'YYYY-MM-DD'), 5);
 
 
INSERT INTO Teacher VALUES (1, 'Michael', 'Johnson', 'michael@email.com', '483-456-129', 6);
INSERT INTO Teacher VALUES (2, 'Tom','Nowak', 'anna@email.com', '987-654-321', 7);
INSERT INTO Teacher VALUES (3, 'Piotr', 'Kowalczyk', 'piotr@email.com', '487-678-333', 8);
INSERT INTO Teacher VALUES (4, 'Sarah', 'Davis', 'sarah@email.com', '488-666-777', 9);
INSERT INTO Teacher VALUES (5, 'Robert', 'Smith', 'robert@email.com', '567-999-000', 10);
 
-- Вставка данных в таблицу Language
INSERT INTO Language VALUES (1, 'English');
INSERT INTO Language VALUES (2, 'Polish');
INSERT INTO Language VALUES (3, 'Spanish');
INSERT INTO Language VALUES (4, 'French');
INSERT INTO Language VALUES (5, 'Italian');
INSERT INTO Language VALUES (6, 'Latin');
 
INSERT INTO "Level" VALUES (1, 'A1', 'Beginner');
INSERT INTO "Level" VALUES (2, 'A2', 'Elementary');
INSERT INTO "Level" VALUES (3,'B1','Intermediate');
INSERT INTO "Level" VALUES (4, 'B2', 'Upper Intermediate');
INSERT INTO "Level" VALUES (5, 'C1', 'Advanced');
INSERT INTO "Level" VALUES (6, 'C2', 'Proficient');
 
INSERT INTO Teacher_level_language VALUES (1, 5, 5 );
INSERT INTO Teacher_level_language VALUES (1, 1, 5);
INSERT INTO Teacher_level_language VALUES (2, 2, 5);
INSERT INTO Teacher_level_language VALUES (2, 6, 4);
INSERT INTO Teacher_level_language VALUES (3, 1, 6);
INSERT INTO Teacher_level_language VALUES (4, 2, 5);
INSERT INTO Teacher_level_language VALUES (5,4, 4);
INSERT INTO Teacher_level_language VALUES (3, 3, 5);
INSERT INTO Teacher_level_language VALUES (3, 2, 6);
INSERT INTO Teacher_level_language VALUES (3,4, 6);
-- Вставка данных в таблицу "Course"
INSERT INTO Course VALUES (1, 10, 'Basic English Course', 1, 1);
INSERT INTO Course VALUES (2, 15, 'Intermediate Polish Course', 3, 2);
INSERT INTO Course VALUES (3, 20, 'Advanced Spanish Course', 5, 3);
INSERT INTO Course VALUES (4, 20, 'Advanced English Course', 5, 1);
INSERT INTO Course VALUES (5, 15, 'Basic Polish Course', 1, 2);
INSERT INTO Course VALUES (6, 12, 'Basic Spanish', 1, 3);
-- Dummy data для групп
 
INSERT INTO "Group" VALUES (1, 'Group 1', 1, 1);
INSERT INTO "Group" VALUES (2, 'Group 2', 2, 2);
INSERT INTO "Group" VALUES (3, 'Group 3', 5, 2);
INSERT INTO "Group" VALUES (4, 'Group 4', 4, 1);
 
 
-- Dummy data для связи студентов с группами
INSERT INTO Student_group VALUES(1, 1);
INSERT INTO Student_group VALUES(3, 3);
INSERT INTO Student_group VALUES(2,1);
INSERT INTO Student_group VALUES(3,1);
INSERT INTO Student_group VALUES(4,3);
INSERT INTO Student_group VALUES(4,1);
INSERT INTO Student_group VALUES(1,2);
INSERT INTO Student_group VALUES(1,3);
 
SELECT * FROM  Student_group;
 
INSERT INTO Room    VALUES (110, 20);
INSERT INTO Room  VALUES  (111, 25);
INSERT INTO Room VALUES   (112, 15);
INSERT INTO Room VALUES (113,8);
INSERT INTO Room VALUES (121,3);
 
 
INSERT INTO Group_room VALUES (1, 110, TO_TIMESTAMP('2024-01-15 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-01-15 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO Group_room VALUES (2, 111, TO_TIMESTAMP('2024-02-01 11:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-02-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
INSERT INTO Group_room VALUES (3, 113, TO_TIMESTAMP('2024-03-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-03-10 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
INSERT INTO Group_room VALUES (4, 113, TO_TIMESTAMP('2024-03-10 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-03-10 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
INSERT INTO Group_room VALUES (5, 113, TO_TIMESTAMP('2024-03-11 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-03-11 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
 
 
-- Вставка данных в таблицу Weekday
INSERT INTO Weekday VALUES (1, 'Monday');
INSERT INTO Weekday VALUES (2, 'Tuesday');
INSERT INTO Weekday VALUES (3, 'Wednesday');
INSERT INTO Weekday VALUES (4, 'Thursday');
INSERT INTO Weekday VALUES (5, 'Friday');
INSERT INTO Weekday VALUES (6, 'Saturday');
INSERT INTO Weekday VALUES (7, 'Sunday');
-- Dummy data для дней в группах и комнатах
INSERT INTO Day_group_room   VALUES  (1, 1);
INSERT INTO Day_group_room   VALUES  (2, 2);
INSERT INTO Day_group_room VALUES   (3, 3);
INSERT INTO Day_group_room   VALUES  (4, 2);
INSERT INTO Day_group_room   VALUES (5, 3);
 
 
INSERT INTO Payment_method  VALUES  (1, 'Credit Card');
INSERT INTO Payment_method    VALUES (2, 'Cash');
INSERT INTO Payment_method    VALUES (3, 'Bank Transfer');
 
 
INSERT INTO Payment   VALUES(1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 400.00, 1, 1, 1, 1);
INSERT INTO Payment    VALUES(2, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 900.00, 0, 2, 2, 1);
INSERT INTO Payment   VALUES(3, TO_DATE('2024-03-03', 'YYYY-MM-DD'), 800.50, 0, 3, 3, 3);
INSERT INTO Payment   VALUES(4, TO_DATE('2024-01-03', 'YYYY-MM-DD'), 700.50, 0, 1, 1, 1);
INSERT INTO Payment   VALUES(5, TO_DATE('2023-12-04', 'YYYY-MM-DD'), 800.50, 0, 1, 1, 1);
/* BEFORE INSERT
   BEFORE UPDATE +
   BEFORE DELETE
Coursor and table triger
   AFTER INSERT
   AFTER UPDATE
   AFTER DELETE
*/
 
/*CREATE OR REPLACE TRIGGER teacher_language_level
BEFORE UPDATE ON Teacher_level_language
FOR EACH ROW
BEGIN
IF :NEW.Level_Id < :OLD.Level_Id
     THEN
      RAISE_APPLICATION_ERROR(-20001, 'The new language level is lower previos one');
END IF;
END;
/ */
/* BEFORE UPDATE ON TABLE  TAECHER_LEVEL_LANGUAGE WE TAKE EACH ROW WHICH WE WANT TO UPDATE
(WE  CHECK LEVEL OF LANGUAGE FOR  EACH TEACHER WE UPDATE AND IF NEW LEVEL IS LOWER WE SHOW THE INFORMATION "The level is lower previos one " and we don't update it)  */
CREATE OR REPLACE TRIGGER teacher_language_level
BEFORE UPDATE ON Teacher_level_language
FOR EACH ROW
BEGIN
IF :NEW.Level_Id < :OLD.Level_Id
     THEN
       DBMS_OUTPUT.PUT_LINE('The new language level is lower previos one');
		:NEW.Level_Id := :OLD.Level_Id;
END IF;
END;
/
 
/*UPDATE Teacher_level_language SET Level_Id=5 WHERE Teacher_Id In (5,3) AND Language_Id =4;  --To check */
--SELECT * FROM Teacher_level_language ;
 
 
/*TRIGGER before_insert_teacher : BEFORE WE INSERT ROWS ON Teacher TABLE (WE CHECK IF IT CONTAINS THE PHONE NUMBER TO CONTACT THE TEACHER
IF NOT WE PUT THE NUMBER TO OUR ADMINISTRATOR )  */
CREATE OR REPLACE TRIGGER before_insert_teacher
BEFORE INSERT ON Teacher
FOR EACH ROW
BEGIN
    IF :NEW.Phone IS NULL OR LENGTH((:NEW.Phone)) = 0 THEN
        :NEW.Phone := '+48888888888';
    END IF;
END;
/
 
/*
     INSERT INTO Teacher (Id, First_name, Last_name, Email, Phone, Adress_Id) values(8, 'Rob', 'Smith', 'rob31_ico@email.com', NULL, 8);
     INSERT INTO Teacher (Id, First_name, Last_name, Email, Phone, Adress_Id) values(9, 'John', 'Anson', 'john_anson@gmail.com', '', 3);
We check the insert into table
 
SELECT * FROM Teacher;*/
 
 
/*TRIGGER before_delete_student : WE DELETE ROWS FROM ANOTHER TABLES  WHERE WE HAVE ID OF DELETED STUDENTS AS FOREIGN KEYS . SO IF WE DELETE STUDENT WITH ID 3
    WE WILL DELETE THE STUDENT WITH AN ID 3  ALSO FROM PAYMENTS AND  FORM STUDENT_GROUP */
 
CREATE OR REPLACE TRIGGER before_delete_student
BEFORE DELETE ON Student
FOR EACH ROW
BEGIN
    DELETE FROM Student_group
    WHERE Student_Id = :OLD.Id;
    DELETE FROM Payment
    WHERE Student_Id = :OLD.Id;
END;
/
/*DELETE  FROM Student WHERE Id=2; 
    check  before_delete_student*/
--SELECT * FROM Student;
 
 
/*  Trigger check_seats_after_ins : AFTER INSERT ON Group room  we create 2 variables , first will check the number seats in the room and
the second one will check how many studens there are  , if students are more than seats we gonna get error with message
*/
 
CREATE OR REPLACE TRIGGER check_seats_after_ins
AFTER INSERT ON Group_room
FOR EACH ROW
DECLARE
    v_group_seats INTEGER;
    v_students_count INTEGER;
BEGIN
    --num of seats
    SELECT r.Seats INTO v_group_seats
    FROM Room r
    WHERE r.Room_number = :NEW.Room_number;
    --num students
    SELECT COUNT(*) INTO v_students_count
    FROM Student_group sg
    WHERE sg.Group_Id = :NEW.Group_Id;
    --check if seats > than students
    IF v_students_count > v_group_seats THEN
        RAISE_APPLICATION_ERROR(-20001, 'Not enought seats in the room.There are only '|| v_group_seats || ' seats '|| 'and we have '|| v_students_count || ' students' );
    END IF;
END;
/
 
/* Check trigger
INSERT INTO Student VALUES (2, 'Jane', 'Smith', TO_DATE('2004-05-20', 'YYYY-MM-DD'), 2);
INSERT INTO Student_group VALUES(2,1);
    INSERT INTO Group_room VALUES (12, 121, TO_TIMESTAMP('2024-03-11 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-03-11 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
*/
 
 
/* TRIGGER after_update_insert_payment_trigger: after we do update on payment
    we use a cursor to find all students whose payment are delate  and we show it with cycle */
 
 --table trigger
CREATE OR REPLACE TRIGGER after_update_payment_trigger
AFTER UPDATE ON Payment
DECLARE
    student_output VARCHAR2(100);
    CURSOR student_cursor IS
        SELECT s.First_name || ' ' || s.Last_name AS student_name,
               p."Date" AS payment_date,
               p.Amount AS payment_amount
        FROM Student s
        JOIN Payment p ON s.Id = p.Student_Id
        WHERE p.Status = 0
          AND p."Date" < SYSDATE;
BEGIN
    FOR student_info IN student_cursor
    LOOP
        student_output := 'This student is late with payment: ' || student_info.student_name ||
                           ', Payment Date: ' || TO_DATE(student_info.payment_date, 'YYYY-MM-DD') ||
                           ', Payment Amount: ' || student_info.payment_amount;
        sys.DBMS_OUTPUT.PUT_LINE(student_output);
    END LOOP;
END;
/
    /*
    update Payment  SET Status=1 WHERE id = 3;
    SELECT * FROM Payment;*/
 
/* Trigger before_delete_teacher : we delete all conections with this teacher */
 
 
CREATE OR REPLACE TRIGGER before_delete_teacher
BEFORE DELETE ON Teacher
FOR EACH ROW
BEGIN
        DELETE FROM Payment
        WHERE Group_Id IN (SELECT Id FROM "Group" WHERE Teacher_Id = :OLD.Id);
        DELETE FROM Day_group_room
        WHERE Group_room_Id IN (SELECT Id FROM Group_room WHERE Group_Id IN (SELECT Id FROM "Group" WHERE Teacher_Id = :OLD.Id));
        DELETE FROM Group_room
        WHERE Group_Id IN (SELECT Id FROM "Group" WHERE Teacher_Id = :OLD.Id);
        DELETE FROM Student_group
        WHERE Group_Id IN (SELECT Id FROM "Group" WHERE Teacher_Id = :OLD.Id);
        DELETE FROM "Group"
        WHERE Teacher_Id = :OLD.Id;
        DELETE FROM Teacher_level_language
        WHERE Teacher_Id = :OLD.Id;
END;
/
  /* TRIGGER after_delete_teacher : we delete teacher and show all information about him */
CREATE OR REPLACE TRIGGER after_delete_teacher
AFTER DELETE ON Teacher
FOR EACH ROW
DECLARE
    v_new_teacher_id INTEGER;
BEGIN
    sys.DBMS_OUTPUT.PUT_LINE('Successfully deleted ' || :OLD.First_name || ' ' || :OLD.Last_name || ' .Teacher`s phone number is ' || :OLD.Phone);
END;
/
--DELETE Teacher WHERE Id=3
 
 
/* Procedure GetEmptyRoomForGivenTime receives timestamp as input, creates cursor room_cursor for all rooms available at this time.
   Then we create variable 'record' that has columns Room_number and seats (from cursor) and variable 'flag' (to check if we need to throw error).
   Then we print information about available rooms. If we did not found available rooms, we throw error */
CREATE OR REPLACE PROCEDURE GetEmptyRoomForGivenTime(
    time_for_room TIMESTAMP
) AS
    CURSOR room_cursor IS
    SELECT DISTINCT Room.Room_number, Room.seats
    FROM Room
    LEFT JOIN GROUP_ROOM on ROOM.ROOM_NUMBER = GROUP_ROOM.ROOM_NUMBER
    WHERE room.ROOM_NUMBER not in(
        select ROOM.ROOM_NUMBER
        from ROOM
        left JOIN GROUP_ROOM on ROOM.ROOM_NUMBER = GROUP_ROOM.ROOM_NUMBER
        where time_for_room between GROUP_ROOM.TIME_START and GROUP_ROOM.TIME_end
        );
    record room_cursor%ROWTYPE;
    flag INTEGER;
BEGIN
    flag := 0;
    OPEN room_cursor;
    LOOP
    FETCH room_cursor INTO record;
    EXIT WHEN room_cursor%NOTFOUND;
    flag := 1;
    sys.DBMS_OUTPUT.PUT_LINE('Room number ' || record.ROOM_NUMBER || ' with ' || record.SEATS || ' seats is available at ' || time_for_room);
  END LOOP;
  CLOSE room_cursor;
    IF flag = 0 then
    RAISE_APPLICATION_ERROR(-20001, 'No available rooms for specified time!');
    end if;
END GetEmptyRoomForGivenTime;

 
--EXECUTE GetEmptyRoomForGivenTime(TO_TIMESTAMP('2024-03-11 10:30:00','YYYY-MM-DD HH24:MI:SS'))

 
/* Procedure GetStudentsFromGroupById, receives group id as input. variable Total_students is number of all students in this group.
   Then define a cursor cur for all students in this group. Create variable 'record' with columns id, student_name, group_id (as in cursor).
   Print every student in this group. Print nubmer of all students*/
CREATE OR REPLACE PROCEDURE GetStudentsFromGroupById(
    input_group_id INTEGER,
    Total_students OUT INTEGER
) AS
    CURSOR cur IS
    SELECT Student.id, Student.First_name || ' ' || Student.Last_name as student_name,Student_group.Group_Id
    FROM Student
    JOIN Student_group  on Student.Id = Student_group.Student_Id
    WHERE Student_group.Group_Id = input_group_id;
    record cur%ROWTYPE;
BEGIN
    Total_students := 0;
    sys.DBMS_OUTPUT.PUT_LINE('Group number: ' || input_group_id);
    OPEN cur;
    LOOP
    FETCH cur INTO record;
    EXIT WHEN cur%NOTFOUND;
    Total_students := Total_students + 1;
    sys.DBMS_OUTPUT.PUT_LINE(Total_students || '. ' || record.student_name || '. Id: ' || record.Id);
  END LOOP;
  CLOSE cur;
  IF Total_students > 0 THEN
  SYS.DBMS_OUTPUT.PUT_LINE('Group number ' || input_group_id || ' contains ' || Total_students || ' student(s).');
  ELSE
  SYS.DBMS_OUTPUT.PUT_LINE('Group number ' || input_group_id || ' does not have any students');
  END IF;
END GetStudentsFromGroupById;

 
/* 
declare
    TOTAL_STUDENTS INTEGER;
begin
    GetStudentsFromGroupById(1,TOTAL_STUDENTS);
end;
 */
 
/* Procedure GetScheduleForStudentById receives student id as input, creates cursor student_cursor for all lessons for this student.
   Then we create variable 'record' that has columns Room_number and seats (from cursor) and variable 'flag' (to check if we need to throw error).
   Then we print information about available rooms. If we did not found available rooms, we throw error */
CREATE OR REPLACE PROCEDURE GetScheduleForStudentById(
    student_input_id INTEGER
) AS
    CURSOR student_cursor IS
    SELECT Student.Id, Group_Room.Room_number AS room, Group_Room.time_start AS "start", Group_Room.time_end AS "end"
    FROM Student
    JOIN Student_Group ON Student.Id = Student_Group.Student_Id
    JOIN Group_Room ON Student_Group.Group_Id = Group_Room.Group_Id
    WHERE Student.Id = student_input_id;
 
    record student_cursor%ROWTYPE;
    student_name VARCHAR2(30);
BEGIN
    SELECT First_name || ' ' || Last_name INTO student_name
    FROM Student
    WHERE Student.Id = student_input_id;
 
    DBMS_OUTPUT.PUT_LINE(student_name || ': ');
 
    OPEN student_cursor;
    LOOP
        FETCH student_cursor INTO record.id, record.room, record."start", record."end";
        EXIT WHEN student_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Lesson in room ' || record.room || ' ( ' || record."start" || ' - ' || record."end" || ' )');
    END LOOP;
 
    CLOSE student_cursor;
END GetScheduleForStudentById;

 
--EXECUTE GetScheduleForStudentById(1);