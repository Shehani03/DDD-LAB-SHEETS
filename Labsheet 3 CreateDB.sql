
-- Create Student table --
CREATE TABLE Student (
    SID VARCHAR(10) PRIMARY KEY,
    Sname VARCHAR(100) NOT NULL,
    Address TEXT,
    dob DATE,
    NIC VARCHAR(10)
);

-- Create Course table --
CREATE TABLE Course (
    CID VARCHAR(10) PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL,
    C_Description TEXT,
    Cfee DECIMAL(10, 2)
);

-- Create Module table --
CREATE TABLE Module (
    Mcode VARCHAR(10) PRIMARY KEY,
    Mname VARCHAR(100) NOT NULL,
    M_Description TEXT,
    NoOfCredits INT
);

-- Create Offers table (after Course and Module) --
CREATE TABLE Offers (
    CID VARCHAR(10),
    Mcode VARCHAR(10),
    Academic_year VARCHAR(9),
    Semester INT,
    PRIMARY KEY (CID, Mcode, Academic_year, Semester),
    FOREIGN KEY (CID) REFERENCES Course(CID),
    FOREIGN KEY (Mcode) REFERENCES Module(Mcode)
);

-- Step 3: Add CHECK constraints using ALTER TABLE --
ALTER TABLE Student
ADD CONSTRAINT chk_nic_format
CHECK (NIC LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][Vv]');

-- CHECK for Module.NoOfCredits --
ALTER TABLE Module
ADD CONSTRAINT chk_credits_value
CHECK (NoOfCredits IN (1, 2, 3, 4));

