

-- Add CID column to Student --
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'Student') AND name = 'CID')
BEGIN
    ALTER TABLE Student
    ADD CID VARCHAR(10);
END

-- Add foreign key constraint for CID in Student referencing Course(CID) --
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Student_Course')
BEGIN
    ALTER TABLE Student
    ADD CONSTRAINT FK_Student_Course FOREIGN KEY (CID) REFERENCES Course(CID);
END

-- Adjust NIC CHECK constraint to match data  --
IF EXISTS (SELECT * FROM sys.check_constraints WHERE name = 'chk_nic_format')
BEGIN
    ALTER TABLE Student
    DROP CONSTRAINT chk_nic_format;
END

ALTER TABLE Student
ADD CONSTRAINT chk_nic_format
CHECK (LEN(NIC) = 9 AND NIC LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][Vv]');

-- Part 1: Insert Data --


-- 1. Insert into Course table --
INSERT INTO Course (CID, Cname, C_Description, Cfee) VALUES
('IT', 'Information Technology', 'The programme which develops capabilities in programming focused', 17500.00),
('SE', 'Software Engineering', 'Software engineering is the discipline of designing, creating and maintaining', 18500.00),
('CSNE', 'Computer Systems And Network Engineering', 'The programme aims to provide students with knowledge, skills, planning, and designing', 15500.00),
('DS', 'Data Science', 'The meticulous curriculum focuses on the fundamentals of computer science, statistics, and applied mathematics', 17000.00);


SELECT * FROM Course;

-- 2. Insert into Student table --
INSERT INTO Student (SID, Sname, Address, dob, NIC, CID) VALUES
('CN183475', 'Kamal', 'No.122, Rose street, matale', '1994-05-02', '94678457V', 'CSNE'),
('DS183476', 'Pubu', 'No.68, 3rd new lane, Maharagama', '1994-10-08', '94786579V', 'DS'),
('IT1823456', 'Ann', 'No.12, kings street, colombo', '1996-11-11', '96123457V', 'IT'),
('SE1823567', 'Maith', 'No.8, st.thomas street, kandy', '1992-12-20', '92235875V', 'SE');


SELECT * FROM Student;

-- 3. Insert into Module table --
INSERT INTO Module (Mcode, Mname, M_Description, NoOfCredits) VALUES
('SE0350', 'User Experience Engineering', 'subject under SE', 3),
('IT1010', 'Introduction to Programming', 'subject under IT', 4),
('IT2050', 'Computer Networks', 'subject under IT', 4),
('DS3051', 'Fundamentals of Data Mining', 'subject under DS', 4);


SELECT * FROM Module;

-- 4. Insert into Offers table --
INSERT INTO Offers (CID, Mcode, Academic_year, Semester) VALUES
('IT', 'IT1010', 'Y3', 1),
('IT', 'IT2050', 'Y2', 1),
('DS', 'DS3051', 'Y3', 2);

-- Verify insert --
SELECT * FROM Offers;

-- Part 2: Update Data --
UPDATE Student
SET Address = 'No. 45, Park Street, Colombo 7'
WHERE Sname = 'Ann';


SELECT * FROM Student WHERE Sname = 'Ann';

-- Part 3: Delete Data --
DELETE FROM Offers WHERE Mcode = 'SE0350';  
DELETE FROM Module
WHERE Mname = 'User Experience Engineering';


SELECT * FROM Module;

