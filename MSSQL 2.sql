CREATE TABLE Address (
    Id int  NOT NULL,
    Street varchar(50)  NOT NULL,
    City varchar(30)  NOT NULL,
    Building_number int  NOT NULL,
    Appartment_numer int  NULL,
    CONSTRAINT Address_primkey PRIMARY KEY  (Id)
);


CREATE TABLE Student (
    Id int  NOT NULL,
    First_name varchar(25)  NOT NULL,
    Last_name varchar(25)  NOT NULL,
    Date_of_birth date  NOT NULL,
    Address_Id int  NOT NULL,
    CONSTRAINT Student_primkey PRIMARY KEY  (Id),
    CONSTRAINT fk_stud_addr FOREIGN KEY (Address_Id) REFERENCES Address (Id)
);

-- Table: Teacher
CREATE TABLE Teacher (
    Id int  NOT NULL,
    First_name varchar(25)  NOT NULL,
    Last_name varchar(25)  NOT NULL,
    Email varchar(30)  NOT NULL,
    Phone varchar(15)  NULL,
    Address_Id int  NOT NULL,
    CONSTRAINT Teacher_primkey PRIMARY KEY  (Id),
    CONSTRAINT fk_teac_addr FOREIGN KEY (Address_Id) REFERENCES Address (Id)
);

-- Table: Language
CREATE TABLE Language (
    Id int  NOT NULL,
    Language_name varchar(50)  NOT NULL,
    CONSTRAINT Language_primkey PRIMARY KEY  (Id)
);

-- Table: Level
CREATE TABLE Level (
    Id int  NOT NULL,
    Sign_level char(2)  NOT NULL,
    Name_level varchar(20)  NOT NULL,
    CONSTRAINT Level_primkey PRIMARY KEY  (Id)
);

-- Table: Teacher_level_language
CREATE TABLE Teacher_level_language (
    Teacher_Id int  NOT NULL,
    Language_Id int  NOT NULL,
    Level_Id int  NOT NULL,
    CONSTRAINT T_lev_lan_primkey PRIMARY KEY  (Language_Id,Level_Id,Teacher_Id),
    CONSTRAINT fk_teachLevLang_lang FOREIGN KEY (Language_Id) REFERENCES Language (Id),
    CONSTRAINT fk_teachLevLang_lev FOREIGN KEY (Level_Id) REFERENCES Level (Id),
    CONSTRAINT fk_teachLevLang_teach FOREIGN KEY (Teacher_Id) REFERENCES Teacher (Id)
);

-- Table: Course
CREATE TABLE Course (
    Id int  NOT NULL,
    Lessons int  NOT NULL,
    Description varchar(100)  NULL,
    Level_Id int  NOT NULL,
    Language_Id int  NOT NULL,
    CONSTRAINT Course_primkey PRIMARY KEY  (Id),
    CONSTRAINT fk_course_lang FOREIGN KEY (Language_Id) REFERENCES Language (Id),
    CONSTRAINT fk_course_lev FOREIGN KEY (Level_Id) REFERENCES Level (Id)
);

-- Table: "Group"
CREATE TABLE "Group" (
    Id int  NOT NULL,
    Name varchar(10)  NOT NULL,
    Course_Id int  NOT NULL,
    Teacher_Id int  NOT NULL,
    CONSTRAINT Group_primkey PRIMARY KEY  (Id),
    CONSTRAINT fk_group_cour FOREIGN KEY (Course_Id) REFERENCES Course (Id),
    CONSTRAINT fk_group_teach FOREIGN KEY (Teacher_Id) REFERENCES Teacher (Id)
);

-- Table: Student_group
CREATE TABLE Student_group (
    Student_Id int  NOT NULL,
    Group_Id int  NOT NULL,
    CONSTRAINT Stud_gr_primkey PRIMARY KEY  (Student_Id,Group_Id),
    CONSTRAINT fk_studGr_stud FOREIGN KEY (Student_Id) REFERENCES Student(Id),
    CONSTRAINT fk_studGr_group FOREIGN KEY (Group_Id) REFERENCES "Group" (Id)

);

-- Table: Room
CREATE TABLE Room (
    Room_number int  NOT NULL,
    Seats int  NOT NULL,
    CONSTRAINT Room_primkey PRIMARY KEY  (Room_number)
);

-- Table: Group_room
CREATE TABLE Group_room (
    Id int  NOT NULL,
    Room_number int  NOT NULL,
    Time_start datetime  NOT NULL,
    Time_end datetime NOT NULL,
    Group_Id int  NOT NULL,
    CONSTRAINT Gr_room_primkey PRIMARY KEY  (Id),
    CONSTRAINT fk_grRoom_group FOREIGN KEY (Group_Id) REFERENCES "Group" (Id),
    CONSTRAINT fk_grRoom_room FOREIGN KEY (Room_number) REFERENCES Room (Room_number)
);


-- Table: Weekday
CREATE TABLE Weekday (
    Id int  NOT NULL,
    Name varchar(15)  NOT NULL,
    CONSTRAINT Wday_primkey PRIMARY KEY  (Id)
);

-- Table: Day_group_room
CREATE TABLE Day_group_room (
    Group_room_Id int  NOT NULL,
    Weekday_Id int  NOT NULL,
    CONSTRAINT D_gr_room_primkey PRIMARY KEY  (Group_room_Id,Weekday_Id),
    CONSTRAINT fk_dGrRoom_grRoom FOREIGN KEY (Group_room_Id) REFERENCES Group_room (Id),
    CONSTRAINT fk_dGrRoom_wDay  FOREIGN KEY (Weekday_Id) REFERENCES Weekday (Id)
);

-- Table: Payment_method
CREATE TABLE Payment_method (
    Id int  NOT NULL,
    Type varchar(20)  NOT NULL,
    CONSTRAINT Pay_method_primkey PRIMARY KEY  (Id)
);

-- Table: Payment
CREATE TABLE Payment (
    Id int  NOT NULL,
    "Date" datetime  NULL,
    Amount MONEY NOT NULL,
    Status smallint  NOT NULL,
    Payment_method_Id int  NULL,
    Student_Id int  NOT NULL,
    Group_Id int  NOT NULL,
    CONSTRAINT Payment_primkey PRIMARY KEY  (Id),
    CONSTRAINT fk_payment_gr FOREIGN KEY (Group_Id) REFERENCES "Group" (Id),
    CONSTRAINT fk_payment_payMethod FOREIGN KEY (Payment_method_Id) REFERENCES Payment_method (Id),
    CONSTRAINT fk_payment_stud FOREIGN KEY (Student_Id) REFERENCES Student (Id)
);


INSERT INTO Address VALUES (1, 'Marsa Street', 'Warsaw', 12, 5);
INSERT INTO Address VALUES (2, 'Marszałkowska Street', 'Warsaw', 34, 7);
INSERT INTO Address VALUES (3, 'Miodowa Street', 'Warsaw', 56, 12);
INSERT INTO Address VALUES (4, 'Mokotowska Street', 'Warsaw', 78, 3);
INSERT INTO Address VALUES (5, 'Zlota Street', 'Warsaw', 44, 213);
INSERT INTO Address VALUES (6, 'New World Street', 'Warsaw', 134, 8);
INSERT INTO Address VALUES (7, 'Płaskowickiej Street', 'Warsaw', 178, 2);
INSERT INTO Address VALUES (8, 'Puławska Street', 'Warsaw', 256, 7);
INSERT INTO Address VALUES (9, 'Koszykowa Street', 'Warsaw', 290, 6);
INSERT INTO Address VALUES (10, 'Twarda Street', 'Warsaw', 54, 7);

-- Assuming you already have a table named 'Student' with columns: Id, FirstName, LastName, BirthDate, GroupId

INSERT INTO Student VALUES (1, 'John', 'Doe', '1990-01-15', 1);
INSERT INTO Student VALUES (2, 'Jane', 'Smith', '2004-05-20', 2);
INSERT INTO Student VALUES (3, 'Andrew', 'Shau', '1995-09-10', 3);
INSERT INTO Student VALUES (4, 'Emily', 'Johnson', '1999-03-25', 4);
INSERT INTO Student VALUES (5, 'Helena', 'Bohn', '2003-03-08', 5);

INSERT INTO Teacher VALUES (1, 'Michael', 'Johnson', 'michael@email.com', '483-456-129', 6);
INSERT INTO Teacher VALUES (2, 'Tom','Nowak', 'anna@email.com', '987-654-321', 7);
INSERT INTO Teacher VALUES (3, 'Piotr', 'Kowalczyk', 'piotr@email.com', '487-678-333', 8);
INSERT INTO Teacher VALUES (4, 'Sarah', 'Davis', 'sarah@email.com', '488-666-777', 9);
INSERT INTO Teacher VALUES (5, 'Robert', 'Smith', 'robert@email.com', '567-999-000', 10);

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



INSERT INTO Course VALUES (1, 10, 'Basic English Course', 1, 1);
INSERT INTO Course VALUES (2, 15, 'Intermediate Polish Course', 3, 2);
INSERT INTO Course VALUES (3, 20, 'Advanced Spanish Course', 5, 3);
INSERT INTO Course VALUES (4, 20, 'Advanced English Course', 5, 1);
INSERT INTO Course VALUES (5, 15, 'Basic Polish Course', 1, 2);
INSERT INTO Course VALUES (6, 12, 'Basic Spanish', 1, 3);

INSERT INTO "Group" VALUES (1, 'Group 1', 1, 1);
INSERT INTO "Group" VALUES (2, 'Group 2', 2, 2);
INSERT INTO "Group" VALUES (3, 'Group 3', 5, 2);
INSERT INTO "Group" VALUES (4, 'Group 4', 4, 1);

INSERT INTO Student_group VALUES(1, 1);
INSERT INTO Student_group VALUES(3, 3);
INSERT INTO Student_group VALUES(2,1);
INSERT INTO Student_group VALUES(3,1);
INSERT INTO Student_group VALUES(4,3);
INSERT INTO Student_group VALUES(4,1);
INSERT INTO Student_group VALUES(1,2);
INSERT INTO Student_group VALUES(1,3);

INSERT INTO Room    VALUES (110, 20);
INSERT INTO Room  VALUES  (111, 25);
INSERT INTO Room VALUES   (112, 15);
INSERT INTO Room VALUES (113,8);
INSERT INTO Room VALUES (121,3);

INSERT INTO Group_room VALUES (1, 110, CONVERT(DATETIME, '2024-01-15 08:30:00', 120), CONVERT(DATETIME, '2024-01-15 09:30:00', 120), 1);
INSERT INTO Group_room VALUES (2, 111, CONVERT(DATETIME, '2024-02-01 11:10:00', 120), CONVERT(DATETIME, '2024-02-01 12:00:00', 120), 2);
INSERT INTO Group_room VALUES (3, 113, CONVERT(DATETIME, '2024-03-10 10:00:00', 120), CONVERT(DATETIME, '2024-03-10 11:00:00', 120), 3);
INSERT INTO Group_room VALUES (4, 113, CONVERT(DATETIME, '2024-03-10 07:00:00', 120), CONVERT(DATETIME, '2024-03-10 08:00:00', 120), 4);
INSERT INTO Group_room VALUES (5, 113, CONVERT(DATETIME, '2024-03-11 10:00:00', 120), CONVERT(DATETIME, '2024-03-11 11:00:00', 120), 1);
INSERT INTO Group_room VALUES (6, 121, CONVERT(DATETIME, '2024-03-12 11:00:00', 120), CONVERT(DATETIME, '2024-03-12 12:00:00', 120), 1);
INSERT INTO Group_room VALUES (7, 121, CONVERT(DATETIME, '2024-03-13 11:00:00', 120), CONVERT(DATETIME, '2024-03-13 12:00:00', 120), 2);

INSERT INTO Weekday VALUES (1, 'Monday');
INSERT INTO Weekday VALUES (2, 'Tuesday');
INSERT INTO Weekday VALUES (3, 'Wednesday');
INSERT INTO Weekday VALUES (4, 'Thursday');
INSERT INTO Weekday VALUES (5, 'Friday');
INSERT INTO Weekday VALUES (6, 'Saturday');
INSERT INTO Weekday VALUES (7, 'Sunday');

INSERT INTO Day_group_room   VALUES  (1, 1);
INSERT INTO Day_group_room   VALUES  (2, 2);
INSERT INTO Day_group_room VALUES   (3, 3);
INSERT INTO Day_group_room   VALUES  (4, 2);
INSERT INTO Day_group_room   VALUES (5, 3);


INSERT INTO Payment_method  VALUES  (1, 'Credit Card');
INSERT INTO Payment_method    VALUES (2, 'Cash');
INSERT INTO Payment_method    VALUES (3, 'Bank Transfer');

INSERT INTO Payment VALUES(1, '2024-03-01 00:00:00', 400.00, 0, 1, 1, 1);
INSERT INTO Payment VALUES(2, '2024-03-02 00:00:00', 900.00, 1, 2, 2, 1);
INSERT INTO Payment VALUES(3, '2024-03-03 00:00:00', 800.50, 0, 3, 3, 3);
INSERT INTO Payment VALUES(4, '2023-03-03 00:00:00', 800.50, 0, 3, 3, 3);

-----Trigers-----
CREATE TRIGGER teacher_language_level ON Teacher_level_language
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;
     DECLARE cursorChangeLevel CURSOR FOR
        SELECT i.Level_Id, d.Level_Id ,d.Teacher_Id,d.Language_Id
        FROM INSERTED i
        JOIN DELETED d ON i.Language_Id = d.Language_Id AND i.Teacher_Id=d.Teacher_Id;

     DECLARE @NewLevelId INT, @OldLevelId INT, @LanguageId INT, @TeacherId INT;
     OPEN cursorChangeLevel
    FETCH NEXT FROM cursorChangeLevel INTO @NewLevelId ,@OldLevelId,@TeacherId ,@LanguageId;

    WHILE @@FETCH_STATUS = 0
        BEGIN
            IF @NewLevelId < @OldLevelId
    BEGIN
        RAISERROR('The new language level is lower than the previous one', 16, 1);--type of mistake 16 create by me
    END
    ELSE
    BEGIN
        UPDATE Teacher_level_language
        SET Level_Id = @NewLevelId
        WHERE Language_Id = @LanguageId AND Teacher_Id = @TeacherId AND Level_Id = @OldLevelId
    END
FETCH NEXT FROM cursorChangeLevel INTO @NewLevelId ,@OldLevelId,@TeacherId ,@LanguageId;
END;
CLOSE cursorChangeLevel;
    DEALLOCATE cursorChangeLevel;

END;

/*
UPDATE Teacher_level_language    SET Level_Id = 4
FROM  Teacher_level_language
WHERE Language_Id = (
     SELECT Id
     from Language
     where Language_name = 'English'
     );
*/
CREATE TRIGGER before_insert_teacher_cknumb ON Teacher
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE cursorCheckPhone CURSOR FOR
        SELECT i.Id , i.First_name,i.Last_name, i.Email, i.Phone , i.Address_Id
        FROM INSERTED i
        DECLARE @Id INT, @First_name VARCHAR(25) ,@Last_name VARCHAR(25), @Email VARCHAR(30) , @Phone Varchar(15),  @Address_Id INT;
     OPEN cursorCheckPhone
    FETCH NEXT FROM cursorCheckPhone INTO @Id,@First_name,@Last_name,@Email,@Phone,@Address_Id;

    WHILE @@FETCH_STATUS = 0
        BEGIN
            IF @Phone IS NULL OR LEN(@Phone) = 0
            BEGIN
                 INSERT INTO Teacher (Id, First_name, Last_name, Email, Phone, Address_Id)
                  VALUES (@Id ,@First_name,@Last_name,@Email,'+48888888888',@Address_Id);

           END
    ELSE
    BEGIN
        INSERT INTO Teacher (Id, First_name, Last_name, Email, Phone, Address_Id)
        VALUES (@Id ,@First_name,@Last_name,@Email,@Phone,@Address_Id);
    END
FETCH NEXT FROM cursorCheckPhone INTO @Id,@First_name,@Last_name,@Email,@Phone,@Address_Id;
END;
CLOSE cursorCheckPhone;
    DEALLOCATE cursorCheckPhone;
END

/*
INSERT INTO Teacher VALUES (24,'Magda','Bronib','magda.bron@icloud.com',NULL,2),
                           (25,'Mary','Joniton','marta.jons@gmail.com','+49533737389',1),
                           (26,'John','Joniton','john.jons@gmail.com','',1);

SELECT *
FROM Teacher
*/

CREATE TRIGGER  instead_delete_student ON Student
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE delete_students CURSOR FOR

    SELECT d.Id
        FROM deleted d
        DECLARE @Id INT;
     OPEN delete_students
    FETCH NEXT FROM delete_students INTO @Id;

    WHILE @@FETCH_STATUS = 0
        BEGIN
          DELETE FROM Student_group
       WHERE Student_Id = @Id;
         DELETE FROM Payment
         WHERE Student_Id = @Id;
             DELETE FROM Student
            WHERE Id = @Id ;

FETCH NEXT FROM delete_students INTO @Id;
END;
CLOSE  delete_students;
    DEALLOCATE delete_students;
END

/*
DELETE FROM Student
WHERE Id IN ( 1,2);
*/

CREATE TRIGGER check_seats_insert ON Group_room
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE insert_students CURSOR FOR
        SELECT i.Id, i.Room_number, i.Group_Id
        FROM INSERTED i;

    DECLARE @Id INT, @Room_number INT, @Group_Id INT;

    OPEN insert_students;
    FETCH NEXT FROM insert_students INTO @Id, @Room_number, @Group_Id;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @seats INT, @students INT;

        SET @students = (SELECT COUNT(*)
                         FROM Student_group
                         WHERE Student_group.Group_Id = @Group_Id);

        SET @seats = (SELECT Seats
                      FROM Room
                      WHERE Room.Room_number = @Room_number);

        IF @students > @seats
        BEGIN
          DECLARE @ErrorMessage NVARCHAR(200);
           SET @ErrorMessage = CONCAT('Not enough seats in the room. There are only ', CONVERT(NVARCHAR(10), @seats), ' seats and we have ', CONVERT(NVARCHAR(10), @students), ' students');
            RAISERROR(@ErrorMessage, -20001, 1);
        END;


        FETCH NEXT FROM insert_students INTO @Id, @Room_number, @Group_Id;
    END;

    CLOSE insert_students;
    DEALLOCATE insert_students;
END;

/*
INSERT INTO Student VALUES (1, 'John', 'Doe', '1990-01-15', 1);
INSERT INTO Student VALUES (2, 'Jane', 'Smith', '2004-05-20', 2);

INSERT INTO Student_group VALUES(1, 1);
INSERT INTO Student_group VALUES(2,1);

INSERT INTO Group_room VALUES (10, 121, CONVERT(DATETIME, '2024-03-12 11:00:00', 120), CONVERT(DATETIME, '2024-03-12 12:00:00', 120), 1);
*/

CREATE TRIGGER after_update_payment_trigger ON Payment
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
     DECLARE payment_cursor CURSOR FOR
       SELECT s.First_name + ' ' + s.Last_name AS student_name,
           p.[Date] AS payment_date,
           p.Amount AS payment_amount
    FROM Student s
    JOIN Payment p ON s.Id = p.Student_Id
    WHERE p.Status = 0 AND p.[Date] < GETDATE();

  DECLARE  @student_name VARCHAR(30),@payment_date datetime ,@amount MONEY;
     OPEN payment_cursor
    FETCH NEXT FROM payment_cursor INTO @student_name,@payment_date,@amount;

    WHILE @@FETCH_STATUS = 0
        BEGIN
      DECLARE @message NVARCHAR(200)   ;
set @message = CONCAT('This student is late with payment: ', @student_name, ' Payment Date ', CONVERT(NVARCHAR(30), @payment_date, 121), ' Payment Amount: ', CONVERT(NVARCHAR(30), @amount));
PRINT @message;
FETCH NEXT FROM payment_cursor INTO @student_name,@payment_date,@amount;
      END
CLOSE payment_cursor;
    DEALLOCATE payment_cursor;
end

--update Payment  SET Status=1 WHERE id = 3;

CREATE TRIGGER bef_delete_teacher ON Teacher
         INSTEAD OF DELETE
         AS
         BEGIN
             SET NOCOUNT ON;
             DECLARE delete_teacher CURSOR FOR
             SELECT d.Id
                 FROM deleted d
                 DECLARE @Id INT;
              OPEN delete_teacher
             FETCH NEXT FROM delete_teacher INTO @Id;
             WHILE @@FETCH_STATUS = 0
                 BEGIN
                     DELETE FROM Payment
                     WHERE Group_Id IN (SELECT Id FROM "Group" WHERE Teacher_Id = @Id);
                     DELETE FROM Day_group_room
                     WHERE Group_room_Id IN (SELECT Id FROM Group_room WHERE Group_Id in (SELECT Id FROM "Group" WHERE Teacher_Id = @Id));
                     DELETE FROM Group_room
                     WHERE Group_Id IN (SELECT Id FROM "Group" WHERE Teacher_Id = @Id);
                     DELETE FROM Student_group
                 WHERE Group_Id IN (SELECT Id FROM "Group" WHERE Teacher_Id = @Id);
                   DELETE FROM "Group"
                WHERE Teacher_Id = @Id;
                  DELETE FROM Teacher_level_language
                  WHERE Teacher_Id = @Id;
              DELETE FROM Teacher
                   WHERE Id = @Id;

          FETCH NEXT FROM delete_teacher INTO @Id;
          END;
         CLOSE  delete_teacher;
             DEALLOCATE delete_teacher;
         END


CREATE  TRIGGER  after_delete_teacher ON Teacher
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
     DECLARE @Id_teacher INT;
  set @Id_teacher= (SELECT d.Id
        FROM deleted d)

DECLARE @First_name VARCHAR(30),@Last_name VARCHAR(30),@Phone_number VARCHAR(30);

SET @First_name = (SELECT  First_name
FROM deleted
WHERE Id = @Id_teacher);
SET @Last_name = (SELECT  Last_name
                   FROM deleted
                  WHERE Id = @Id_teacher ) ;
  SET @Phone_number = (SELECT  Phone
                   FROM deleted
                  WHERE Id = @Id_teacher ) ;

DECLARE @ms_about_del_teach NVARCHAR(200)   ;
set @ms_about_del_teach = CONCAT('Successfully deleted ', @First_name, '  ', @Last_name ,'. Teacher`s phone number is : ' ,CONVERT(NVARCHAR(30), @Phone_number));
PRINT @ms_about_del_teach;
END

--DELETE FROM  Teacher WHERE Id=1;

--result set
/* Procedure GetPayments is a result set type procedure. It Prints all payments with status 0*/
CREATE PROCEDURE getPayments
AS
   SET NOCOUNT ON;
   SELECT Student.Id, Student.First_name, Student.Last_name,"Group".Name, Payment.Amount, Payment.Date,Payment_method.Type ,Payment.Status
       FROM Student
           JOIN Payment on Student.Id = Payment.Student_Id
           JOIN Payment_method  on Payment_method.Id = Payment.Payment_method_Id
           JOIN "Group" on "Group".Id = Payment.Group_Id
        WHERE Payment.Status = 0;

--EXECUTE GetPayments

--output
/* Procedure getTeachersForLanguage is output type procedure. Prints all teachers for this language and then outputs amount of teachers*/
create procedure getTeachersForLanguage(
   @language varchar(30),
   @teachers_amount INT OUTPUT
)
AS
BEGIN
   SET NOCOUNT ON;
   SET @teachers_amount = (SELECT COUNT(Teacher_level_language.Teacher_Id)
       FROM Teacher_level_language
       JOIN Language L on L.Id = Teacher_level_language.Language_Id
   WHERE L.Language_name = @language)

   SELECT T.First_name, T.Last_name, L.Language_name, L2.Sign_level, L2.Name_level
       FROM Teacher_level_language
       JOIN Language L on L.Id = Teacher_level_language.Language_Id
       JOIN Level L2 on L2.Id = Teacher_level_language.Level_Id
       JOIN Teacher T on T.Id = Teacher_level_language.Teacher_Id
   WHERE L.Language_name = @language
END;

/*
Declare @Teacher_amount INT
EXECUTE getTeachersForLanguage 'Polish', @Teacher_amount OUTPUT
PRINT @Teacher_amount
*/

--return
/* Procedure getAmountOfLessons is a return type procedure.Gets date as input. Procedure prints amount of lessons for this day */
create procedure getAmountOfLessons
    @dateToCount date
AS
    BEGIN
    set nocount on;
    declare @amountOfLessons INT;

    SELECT @amountOfLessons = COUNT(id)
    from Group_room
    where CONVERT(date, Time_start) = @dateToCount;

    return @amountOfLessons;
    end;

/*
Declare @amount INT
EXECUTE @amount= getAmountOfLessons '2024-02-01'
PRINT @amount
*/
