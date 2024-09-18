CREATE DATABASE Metropolis_Exploration

USE Metropolis_Exploration

--QUERY NO.1
--HERE WE CREATE TABLE 'Wards'

CREATE TABLE Ward (
  Ward_ID INT IDENTITY(1,1) PRIMARY KEY,
  Ward_Name VARCHAR(255),
  Area DECIMAL(10,2),
  Population_Count NUMERIC,
  Number_of_Buildings NUMERIC,
  Number_of_Vehicles NUMERIC,
  Average_Income DECIMAL(10,2),
  Crime_Rate DECIMAL(5,2),
  Business_Count NUMERIC,
  Unemployment_Rate DECIMAL(5,2)
);


--QUERY NO.2
--HERE WE INSERT INTO 'wards'

INSERT INTO Ward(Ward_Name, Area, Population_Count, Number_of_Buildings, Number_of_Vehicles, Average_Income, Crime_Rate, Business_Count, Unemployment_Rate)
VALUES
('Ward 1', 12.3, 200000, 5000, 10000, 20000, 5.2, 1000, 10.5),
('Ward 2', 15.6, 300000, 7000, 15000, 25000, 6.1, 1500, 9.8),
('Ward 3', 8.5, 150000, 3000, 8000, 30000, 4.7, 800, 8.3),
('Ward 4', 10.2, 250000, 6000, 12000, 35000, 5.5, 1200, 7.9),
('Ward 5', 14.9, 280000, 6500, 13000, 28000, 5.8, 1300, 8.7),
('Ward 6', 13.1, 220000, 5500, 11000, 23000, 5.3, 1100, 10.3),
('Ward 7', 9.8, 180000, 4000, 9000, 21000, 4.9, 900, 9.1),
('Ward 8', 11.5, 220000, 5500, 11000, 24000, 5.2, 1000, 8.5),
('Ward 9', 13.7, 260000, 6200, 12500, 27000, 5.6, 1150, 9.4),
('Ward 10', 16.2, 320000, 7500, 14000, 26000, 5.4, 1200, 7.7);

SELECT * FROM Ward

--QUERY NO.3
--HERE WE CREATE TABLE 'Ward_info'

CREATE TABLE Ward_info (
  Area_ID INT IDENTITY(1,1) PRIMARY KEY,
  Ward_ID INT NOT NULL,
  Area VARCHAR(255),
  Number_of_Households INT,
  Number_of_Schools INT,
  Number_of_Hospitals INT,
  Number_of_Parks INT,
  Number_of_Public_Transportation_Stops INT,
  Number_of_Public_Utilities INT,
  Number_of_Government_Offices INT,
  Number_of_Community_Centers INT,
  Number_of_Playgrounds INT,
  Number_of_Libraries INT,
  FOREIGN KEY (Ward_ID) REFERENCES Ward(Ward_ID)
);

--QUERY NO.4
--HERE WE INSERT INTO TABLE 'Ward_info'

INSERT INTO Ward_info(Ward_ID, Area, Number_of_Households, Number_of_Schools, Number_of_Hospitals, Number_of_Parks, Number_of_Public_Transportation_Stops, Number_of_Public_Utilities, Number_of_Government_Offices, Number_of_Community_Centers, Number_of_Playgrounds, Number_of_Libraries)
VALUES
( 1, 'Area 1', 610, 10, 3, 6, 8, 10, 12, 14, 16, 18),
( 1, 'Area 2', 1440, 18, 5, 13, 17, 22, 10, 18, 10, 14),
( 1, 'Area 3', 800, 12, 4, 8, 10, 14, 11, 16, 12, 20),
( 1, 'Area 4', 950, 15, 6, 10, 12, 16, 13, 18, 14, 22),
( 1, 'Area 5', 720, 11, 3, 7, 9, 12, 10, 14, 10, 16),
( 1, 'Area 6', 880, 14, 5, 9, 11, 15, 12, 15, 12, 18),
( 1, 'Area 7', 900, 13, 4, 8, 10, 14, 11, 16, 12, 20),
( 1, 'Area 8', 1100, 16, 6, 10, 12, 16, 13, 18, 14, 22),
( 1, 'Area 9', 780, 10, 3, 7, 9, 12, 10, 14, 10, 16),
( 1, 'Area 10', 950, 15, 5, 9, 11, 15, 12, 15, 12, 18),
( 2, 'Area 11', 1550, 20, 7, 12, 15, 20, 15, 20, 15, 22),
( 3, 'Area 12', 1250, 16, 5, 10, 13, 18, 14, 18, 12, 19),
( 4, 'Area 13', 1400, 18, 6, 11, 14, 17, 16, 20, 15, 23),
( 5, 'Area 14', 1150, 14, 4, 9, 12, 16, 13, 17, 13, 21),
( 6, 'Area 15', 1350, 19, 7, 13, 16, 21, 17, 21, 15, 24),
( 7, 'Area 16', 1300, 17, 5, 10, 13, 18, 14, 18, 12, 20),
( 8, 'Area 17', 1450, 21, 6, 12, 15, 20, 15, 20, 15, 22),
( 9, 'Area 18', 1200, 15, 4, 9, 12, 16, 13, 17, 13, 21),
( 10, 'Area 19', 1600, 22, 5, 11, 14, 19, 16, 20, 15, 23),
( 2, 'Area 20', 1650, 20, 7, 12, 15, 20, 15, 20, 15, 22),
( 3, 'Area 21', 1300, 16, 5, 10, 13, 18, 14, 18, 12, 19),
( 4, 'Area 22', 1450, 18, 6, 11, 14, 17, 16, 20, 15, 23),
( 5, 'Area 23', 1200, 14, 4, 9, 12, 16, 13, 17, 13, 21),
( 6, 'Area 24', 1500, 19, 7, 13, 16, 21, 17, 21, 15, 24),
( 7, 'Area 25', 1350, 17, 5, 10, 13, 18, 14, 18, 12, 20),
( 8, 'Area 26', 1700, 21, 6, 12, 15, 20, 15, 20, 15, 22),
( 9, 'Area 27', 1400, 15, 4, 9, 12, 16, 13, 17, 13, 21),
( 10, 'Area 28', 1650, 22, 5, 11, 14, 19, 16, 20, 15, 23),
( 2, 'Area 29', 1750, 20, 7, 12, 15, 20, 15, 20, 15, 22),
( 3, 'Area 30', 1450, 16, 5, 10, 13, 18, 14, 18, 12, 19),
( 5, 'Area 36', 720, 6, 1, 1, 4, 0, 0, 1, 4, 0),
( 5, 'Area 37', 740, 7, 2, 2, 5, 1, 1, 2, 5, 1),
( 5, 'Area 38', 760, 8, 3, 3, 6, 2, 2, 3, 6, 2),
( 5, 'Area 39', 780, 9, 4, 4, 7, 3, 3, 4, 7, 3),
( 5, 'Area 40', 800, 0, 0, 5, 0, 4, 4, 5, 0, 4),
( 6, 'Area 41', 820, 1, 1, 6, 1, 5, 5, 6, 1, 5),
( 6, 'Area 42', 840, 2, 2, 0, 2, 6, 6, 0, 2, 6),
( 6, 'Area 43', 860, 3, 3, 1, 3, 7, 0, 1, 3, 7),
( 6, 'Area 44', 880, 4, 4, 2, 4, 8, 1, 2, 4, 8),
( 6, 'Area 45', 900, 5, 0, 3, 5, 0, 2, 3, 5, 0),
( 7, 'Area 46', 920, 6, 1, 4, 6, 1, 3, 4, 6, 1),
( 7, 'Area 47', 940, 7, 2, 5, 7, 2, 4, 5, 7, 2),
( 7, 'Area 48', 960, 8, 3, 6, 0, 3, 5, 6, 0, 3),
( 7, 'Area 49', 980, 9, 4, 0, 1, 4, 6, 0, 1, 4),
( 7, 'Area 50', 1000, 0, 0, 1, 2, 5, 0, 1, 2, 5),
( 8, 'Area 51', 1020, 1, 1, 2, 3, 6, 1, 2, 3, 6),
( 8, 'Area 52', 1040, 2, 2, 3, 4, 7, 2, 3, 4, 7),
( 8, 'Area 53', 1060, 3, 3, 4, 5, 8, 3, 4, 5, 8),
( 8, 'Area 54', 1080, 4, 4, 5, 6, 0, 4, 5, 6, 0),
( 8, 'Area 55', 1100, 5, 0, 6, 7, 1, 5, 6, 7, 1),
( 9, 'Area 56', 1120, 6, 1, 0, 0, 2, 6, 0, 0, 2),
( 9, 'Area 57', 1140, 7, 2, 1, 1, 3, 0, 1, 1, 3),
( 9, 'Area 58', 1160, 8, 3, 2, 2, 4, 1, 2, 2, 4),
( 9, 'Area 59', 1180, 9, 4, 3, 3, 5, 2, 3, 3, 5),
( 9, 'Area 60', 1200, 0, 0, 4, 4, 6, 3, 4, 4, 6),
( 10, 'Area 61', 1220, 1, 1, 5, 5, 7, 4, 5, 5, 7),
( 10, 'Area 62', 1240, 2, 2, 6, 6, 8, 5, 6, 6, 8),
( 10, 'Area 63', 1260, 3, 3, 0, 7, 0, 6, 0, 7, 0),
( 10, 'Area 64', 1280, 4, 4, 1, 0, 1, 0, 1, 0, 1),
( 10, 'Area 65', 1300, 5, 0, 2, 1, 2, 1, 2, 1, 2);

SELECT * FROM Ward_info





--QUERY NO.6
--HERE WE CREATE TABLE 'People'

CREATE TABLE People (
    People_ID INT IDENTITY(1,1) PRIMARY KEY,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Date_of_Birth DATE,
    Gender VARCHAR(10),
    Occupation VARCHAR(255),
	Profession VARCHAR(255),
    Income DECIMAL(10,2),
    Marital_Status VARCHAR(255),
    Number_of_Children INT,
    Education_Level VARCHAR(255),
    Religion VARCHAR(255),
    Language_ VARCHAR(255),
    National_ID VARCHAR(50),
	Ward_ID INT,
	Area_ID INT,
	FOREIGN KEY (Ward_ID) REFERENCES Ward(Ward_ID),
	FOREIGN KEY (Area_ID) REFERENCES Ward_info(Area_ID)
);


--QUERY NO.7
--HERE WE INSERT INTO 'People'

INSERT INTO People (First_Name, Last_Name, Date_of_Birth, Gender, Occupation, Profession, Income, Marital_Status, Number_of_Children, Education_Level, Religion, Language_, National_ID, Ward_ID, Area_ID)
VALUES
('Michael', 'Brown', '1987-07-07', 'Male', 'Engineer', 'Mechanical', 82000.00, 'Married', 1, 'Master''s', 'Christianity', 'English', '7894561230', 1, 1),
('Jennifer', 'Smith', '1982-09-15', 'Female', 'Doctor', 'Pediatrician', 92000.00, 'Married', 2, 'MD', 'Christianity', 'English', '4567890123', 1, 1),
('Daniel', 'Johnson', '1993-10-20', 'Male', 'Teacher', 'Elementary', 55000.00, 'Single', 0, 'Bachelor''s', 'Atheism', 'English', '6549873201', 2, 1),
('Sophia', 'Martinez', '1983-12-25', 'Female', 'Lawyer', 'Criminal', 110000.00, 'Married', 1, 'JD', 'Christianity', 'English', '7890123456', 2, 2),
('Andrew', 'Garcia', '1996-01-30', 'Male', 'Artist', 'Painter', 48000.00, 'Single', 0, 'High School', 'Agnosticism', 'Spanish', '3219876540', 3, 1),
('Olivia', 'Brown', '1990-02-10', 'Female', 'Marketing', 'Manager', 78000.00, 'Single', 0, 'MBA', 'Christianity', 'English', '0123456789', 3, 2),
('James', 'Martinez', '1976-04-15', 'Male', 'Finance', 'Manager', 105000.00, 'Married', 2, 'PhD', 'Christianity', 'English', '9876543210', 4, 1),
('Emma', 'Lee', '1984-05-20', 'Female', 'IT', 'Developer', 88000.00, 'Married', 0, 'Master''s', 'Atheism', 'English', '7418529630', 4, 2),
('Alexander', 'Nguyen', '1992-08-05', 'Male', 'Sales', 'Representative', 72000.00, 'Married', 1, 'Bachelor''s', 'Atheism', 'English', '3698521470', 5, 1),
('Ava', 'Chen', '1988-11-18', 'Female', 'Human Resources', 'Recruiter', 60000.00, 'Single', 0, 'Bachelor''s', 'Buddhism', 'English', '2589631470', 5, 2),
('William', 'Wang', '1985-03-12', 'Male', 'Engineer', 'Electrical', 85000.00, 'Married', 2, 'Master''s', 'Christianity', 'English', '8529637410', 1, 1),
('Mia', 'Kumar', '1980-06-25', 'Female', 'Doctor', 'Surgeon', 95000.00, 'Married', 3, 'MD', 'Hinduism', 'English', '1472583690', 1, 1),
('Ethan', 'Patel', '1990-09-30', 'Male', 'Teacher', 'High School', 58000.00, 'Single', 0, 'Bachelor''s', 'Hinduism', 'English', '9638527410', 2, 1),
('Isabella', 'Gonzalez', '1975-12-05', 'Female', 'Lawyer', 'Corporate', 115000.00, 'Married', 2, 'JD', 'Christianity', 'English', '3691472580', 2, 2),
('Ryan', 'Lopez', '1997-01-10', 'Male', 'Artist', 'Sculptor', 45000.00, 'Single', 0, 'High School', 'Agnosticism', 'Spanish', '2589631470', 3, 1),
('Avery', 'Perez', '1989-04-20', 'Female', 'Marketing', 'Director', 82000.00, 'Single', 1, 'MBA', 'Atheism', 'English', '9876543210', 3, 2),
('Noah', 'Rodriguez', '1977-05-15', 'Male', 'Finance', 'Accountant', 110000.00, 'Married', 2, 'PhD', 'Christianity', 'English', '1234567890', 4, 1),
('Sophia', 'Hernandez', '1983-06-20', 'Female', 'IT', 'Administrator', 90000.00, 'Married', 1, 'Master''s', 'Christianity', 'English', '4567890123', 4, 2),
('Logan', 'Nguyen', '1993-09-25', 'Male', 'Sales', 'Associate', 74000.00, 'Married', 2, 'Bachelor''s', 'Buddhism', 'English', '7890123456', 5, 1),
('Evelyn', 'Kim', '1987-11-30', 'Female', 'Human Resources', 'Manager', 62000.00, 'Single', 0, 'Bachelor''s', 'Christianity', 'English', '0123456789', 5, 2),
('Benjamin', 'Liu', '1984-02-10', 'Male', 'Engineer', 'Civil', 87000.00, 'Married', 1, 'Master''s', 'Atheism', 'English', '3698521470', 1, 1),
('Charlotte', 'Singh', '1980-03-25', 'Female', 'Doctor', 'General Practitioner', 93000.00, 'Married', 2, 'MD', 'Hinduism', 'English', '2589631470', 1, 1),
('Mason', 'Wong', '1995-06-30', 'Male', 'Teacher', 'Middle School', 56000.00, 'Single', 0, 'Bachelor''s', 'Atheism', 'English', '8529637410', 2, 1),
('Amelia', 'Patel', '1986-09-15', 'Female', 'Lawyer', 'Criminal Defense', 120000.00, 'Married', 1, 'JD', 'Hinduism', 'English', '7418529630', 2, 2),
('Elijah', 'Garcia', '1990-12-20', 'Male', 'Artist', 'Illustrator', 49000.00, 'Single', 0, 'High School', 'Agnosticism', 'Spanish', '3692581470', 3, 1),
('Harper', 'Kim', '1988-01-05', 'Female', 'Marketing', 'Coordinator', 79000.00, 'Single', 0, 'MBA', 'Atheism', 'English', '1472583690', 3, 2),
('Lucas', 'Lee', '1978-04-10', 'Male', 'Finance', 'Financial Analyst', 107000.00, 'Married', 3, 'PhD', 'Christianity', 'English', '9638527410', 4, 1),
('Evelyn', 'Gomez', '1982-07-15', 'Female', 'IT', 'Developer', 91000.00, 'Married', 2, 'Master''s', 'Christianity', 'English', '2589631470', 4, 2),
('Jacob', 'Hernandez', '1991-10-20', 'Male', 'Sales', 'Manager', 76000.00, 'Married', 1, 'Bachelor''s', 'Christianity', 'English', '7418529630', 5, 1),
('Ella', 'Nguyen', '1989-02-25', 'Female', 'Human Resources', 'Recruiter', 63000.00, 'Single', 0, 'Bachelor''s', 'Buddhism', 'English', '3692581470', 5, 2),
('Alexander', 'Chen', '1986-05-30', 'Male', 'Engineer', 'Mechanical', 83000.00, 'Married', 1, 'Master''s', 'Atheism', 'English', '1472583690', 1, 1),
('Madison', 'Gupta', '1981-08-15', 'Female', 'Doctor', 'Surgeon', 97000.00, 'Married', 2, 'MD', 'Hinduism', 'English', '9638527410', 1, 1),
('Jackson', 'Shah', '1994-11-20', 'Male', 'Teacher', 'Elementary', 59000.00, 'Single', 0, 'Bachelor''s', 'Atheism', 'English', '2589631470', 2, 1),
('Aria', 'Li', '1976-01-05', 'Female', 'Lawyer', 'Corporate', 118000.00, 'Married', 2, 'JD', 'Atheism', 'English', '7418529630', 2, 2),
('Carter', 'Ali', '1998-02-10', 'Male', 'Artist', 'Painter', 47000.00, 'Single', 0, 'High School', 'Agnosticism', 'Spanish', '3692581470', 3, 1),
('Scarlett', 'Sharma', '1990-05-15', 'Female', 'Marketing', 'Specialist', 80000.00, 'Single', 0, 'MBA', 'Hinduism', 'English', '1472583690', 3, 2),
('Gabriel', 'Garcia', '1979-08-20', 'Male', 'Finance', 'Manager', 115000.00, 'Married', 3, 'PhD', 'Christianity', 'English', '9638527410', 4, 1),
('Zoe', 'Kim', '1984-11-25', 'Female', 'IT', 'Administrator', 93000.00, 'Married', 1, 'Master''s', 'Christianity', 'English', '2589631470', 4, 2),
('Julian', 'Hernandez', '1995-03-01', 'Male', 'Sales', 'Representative', 78000.00, 'Married', 2, 'Bachelor''s', 'Christianity', 'English', '7418529630', 5, 1),
('Layla', 'Nguyen', '1989-06-05', 'Female', 'Human Resources', 'Generalist', 65000.00, 'Single', 0, 'Bachelor''s', 'Buddhism', 'English', '3692581470', 5, 2),
('Joseph', 'Chen', '1985-09-10', 'Male', 'Engineer', 'Electrical', 89000.00, 'Married', 2, 'Master''s', 'Atheism', 'English', '1472583690', 1, 1),
('Lily', 'Shah', '1980-12-15', 'Female', 'Doctor', 'General Practitioner', 94000.00, 'Married', 2, 'MD', 'Hinduism', 'English', '9638527410', 1, 1),
('John', 'Ali', '1996-01-20', 'Male', 'Teacher', 'Middle School', 61000.00, 'Single', 0, 'Bachelor''s', 'Atheism', 'English', '2589631470', 2, 1),
('Chloe', 'Singh', '1981-04-05', 'Female', 'Lawyer', 'Corporate', 120000.00, 'Married', 1, 'JD', 'Christianity', 'English', '7418529630', 2, 2),
('Daniel', 'Ahmed', '1983-07-10', 'Male', 'Artist', 'Graphic Designer', 51000.00, 'Single', 0, 'High School', 'Agnosticism', 'Spanish', '3692581470', 3, 1),
('Sophia', 'Sharma', '1990-10-15', 'Female', 'Marketing', 'Manager', 82000.00, 'Single', 0, 'MBA', 'Hinduism', 'English', '1472583690', 3, 2),
('Matthew', 'Gomez', '1975-01-20', 'Male', 'Finance', 'Financial Analyst', 112000.00, 'Married', 3, 'PhD', 'Christianity', 'English', '9638527410', 4, 1),
('Grace', 'Lee', '1983-04-25', 'Female', 'IT', 'Developer', 92000.00, 'Married', 1, 'Master''s', 'Christianity', 'English', '2589631470', 4, 2),
('Christopher', 'Hernandez', '1991-07-01', 'Male', 'Sales', 'Manager', 78000.00, 'Married', 2, 'Bachelor''s', 'Christianity', 'English', '7418529630', 5, 1),
('Nora', 'Nguyen', '1989-10-05', 'Female', 'Human Resources', 'Recruiter', 67000.00, 'Single', 0, 'Bachelor''s', 'Buddhism', 'English', '3692581470', 5, 2),
('Andrew', 'Chen', '1986-01-10', 'Male', 'Engineer', 'Mechanical', 84000.00, 'Married', 1, 'Master''s', 'Atheism', 'English', '1472583690', 1, 1),
('Anna', 'Gupta', '1981-04-15', 'Female', 'Doctor', 'Surgeon', 96000.00, 'Married', 2, 'MD', 'Hinduism', 'English', '9638527410', 1, 1),
('Jonathan', 'Shah', '1994-07-20', 'Male', 'Teacher', 'Elementary', 60000.00, 'Single', 0, 'Bachelor''s', 'Atheism', 'English', '2589631470', 2, 1),
('Aurora', 'Li', '1976-10-25', 'Female', 'Lawyer', 'Corporate', 122000.00, 'Married', 2, 'JD', 'Atheism', 'English', '7418529630', 2, 2),
('Gabriel', 'Ali', '1998-01-30', 'Male', 'Artist', 'Painter', 49000.00, 'Single', 0, 'High School', 'Agnosticism', 'Spanish', '3692581470', 3, 1),
('Hannah', 'Sharma', '1990-05-05', 'Female', 'Marketing', 'Specialist', 83000.00, 'Single', 0, 'MBA', 'Hinduism', 'English', '1472583690', 3, 2),
('Daniel', 'Garcia', '1979-08-10', 'Male', 'Finance', 'Manager', 116000.00, 'Married', 3, 'PhD', 'Christianity', 'English', '9638527410', 4, 1),
('Ava', 'Kim', '1984-11-15', 'Female', 'IT', 'Administrator', 94000.00, 'Married', 1, 'Master''s', 'Christianity', 'English', '2589631470', 4, 2),
('Nicholas', 'Hernandez', '1995-03-20', 'Male', 'Sales', 'Representative', 79000.00, 'Married', 2, 'Bachelor''s', 'Christianity', 'English', '7418529630', 5, 1),
('Elizabeth', 'Nguyen', '1989-06-25', 'Female', 'Human Resources', 'Generalist', 66000.00, 'Single', 0, 'Bachelor''s', 'Buddhism', 'English', '3692581470', 5, 2);

SELECT * FROM People





--QUERY NO.8
--HERE WE CREATE TABLE 'Buildings'

CREATE TABLE Buildings (
    Building_ID INT IDENTITY(1,1) PRIMARY KEY,
    Building_Name VARCHAR(255) NOT NULL,
    Building_Type VARCHAR(255) NOT NULL,
    Number_of_Floors INT NOT NULL,
    Total_Area FLOAT NOT NULL,
    Year_Built INT NOT NULL,
    Number_of_Rooms INT NOT NULL,
    Number_of_Parkings INT NOT NULL,
	Ward_ID INT,
	FOREIGN KEY (Ward_ID) REFERENCES Ward(Ward_ID)
);


--QUERY NO.9
--HERE WE INSERT INTO 'Buildings'

INSERT INTO Buildings (Building_Name, Building_Type, Number_of_Floors, Total_Area, Year_Built, Number_of_Rooms, Number_of_Parkings, Ward_ID)
VALUES
('Building A', 'Office', 5, 12000, 2015, 50, 20, 6),
('Building B', 'Residential', 3, 8000, 2018, 30, 10, 7),
('Building C', 'Mixed Use', 7, 20000, 2010, 75, 30, 8),
('Building D', 'Commercial', 2, 6000, 2020, 25, 5, 9),
('Building E', 'Industrial', 6, 25000, 2012, 100, 50, 10),
('Building F', 'Office', 4, 10000, 2016, 40, 15, 2),
('Building G', 'Residential', 5, 12000, 2019, 45, 12, 3),
('Building H', 'Mixed Use', 8, 22000, 2011, 80, 35, 4),
('Building I', 'Commercial', 3, 7000, 2021, 30, 8, 5),
('Building J', 'Industrial', 7, 28000, 2013, 110, 60, 6),
('Building K', 'Office', 6, 15000, 2017, 60, 25, 7),
('Building L', 'Residential', 4, 10000, 2020, 35, 15, 8),
('Building M', 'Mixed Use', 9, 24000, 2012, 90, 40, 9),
('Building N', 'Commercial', 4, 8000, 2022, 35, 10, 10),
('Building O', 'Industrial', 8, 30000, 2014, 120, 70, 2),
('Building P', 'Office', 7, 18000, 2018, 70, 30, 3),
('Building Q', 'Residential', 5, 11000, 2021, 40, 20, 4),
('Building R', 'Mixed Use', 10, 26000, 2013, 100, 45, 5),
('Building S', 'Commercial', 5, 9000, 2023, 40, 12, 6),
('Building T', 'Industrial', 9, 32000, 2015, 130, 80, 7),
('Building U', 'Office', 8, 20000, 2019, 80, 35, 8),
('Building V', 'Residential', 6, 13000, 2022, 50, 25, 9),
('Building W', 'Mixed Use', 11, 28000, 2014, 110, 50, 10),
('Building X', 'Commercial', 6, 10000, 2024, 45, 15, 2),
('Building Y', 'Industrial', 10, 35000, 2016, 150, 90, 3),
('Building Z', 'Office', 9, 22000, 2020, 90, 40, 4);






--QUERY NO.10
--HERE WE CREATE TABLE 'Vehicles'


CREATE TABLE Vehicles (
    Vehicle_ID INT IDENTITY(1,1) PRIMARY KEY,
    Building_ID INT,
    Vehicle_Type VARCHAR(255),
    Vehicle_Make VARCHAR(255),
    Vehicle_Model VARCHAR(255),
    Vehicle_Year INT,
    Vehicle_Color VARCHAR(255),
    Vehicle_Parking_Spot INT,
    FOREIGN KEY (Building_ID) REFERENCES Buildings(Building_ID)
);

--QUERY NO.11
--HERE WE INSERT INTO 'Vehicles'

INSERT INTO Vehicles ( Building_ID, Vehicle_Type, Vehicle_Make, Vehicle_Model, Vehicle_Year, Vehicle_Color, Vehicle_Parking_Spot)
VALUES
( 1, 'Car', 'Toyota', 'Camry', 2018, 'Blue', 1),
( 1, 'Car', 'Honda', 'Civic', 2020, 'Red', 1),
( 2, 'SUV', 'Ford', 'Explorer', 2019, 'Black', 2),
( 2, 'Car', 'Hyundai', 'Elantra', 2017, 'Silver', 2),
( 3, 'Truck', 'Chevrolet', 'Silverado', 2021, 'White', 3),
( 3, 'Car', 'Nissan', 'Altima', 2016, 'Gray', 3),
( 4, 'Car', 'Tesla', 'Model 3', 2022, 'Black', 4),
( 4, 'SUV', 'Subaru', 'Outback', 2020, 'Green', 4),
( 5, 'Truck', 'Ford', 'F-150', 2015, 'Blue', 5),
( 5, 'Car', 'Toyota', 'Corolla', 2017, 'White', 5),
(6, 'Car', 'Honda', 'Accord', 2019, 'Red', 6),
(7, 'SUV', 'Toyota', 'Rav4', 2020, 'Blue', 7),
(8, 'Truck', 'Chevrolet', 'Colorado', 2018, 'Silver', 8),
(9, 'Car', 'Ford', 'Mustang', 2021, 'Black', 9),
(10, 'SUV', 'Jeep', 'Cherokee', 2017, 'Gray', 10),
(11, 'Car', 'Volkswagen', 'Jetta', 2016, 'White', 11),
(12, 'Truck', 'GMC', 'Sierra', 2020, 'Red', 12),
(13, 'Car', 'BMW', '3 Series', 2019, 'Black', 13),
(14, 'SUV', 'Kia', 'Sorento', 2018, 'Blue', 14),
(15, 'Truck', 'Ram', '1500', 2017, 'Silver', 15);







--QUERY NO.12
--HERE WE CREATE TABLE 'EnvData'(Environmental Data)

CREATE TABLE EnvData (
    id INT IDENTITY(1,1) PRIMARY KEY,
    location VARCHAR(100),
    temperature DECIMAL(5,2),
    humidity DECIMAL(5,2),
    pollution_level DECIMAL(5,2),
    recorded_at TIMESTAMP,
	Area_ID INT,
	FOREIGN KEY (Area_ID) REFERENCES Ward_info(Area_ID)
);


--QUERY NO.13
--HERE WE INSERT INTO 'EnvData'

INSERT INTO EnvData (location, temperature, humidity, pollution_level, Area_ID) VALUES
('Location1', 25.65, 60.25, 12.80, 1),
('Location2', 23.45, 55.30, 10.20, 2),
('Location3', 27.80, 58.90, 15.75, 3),
('Location4', 22.10, 65.20, 11.45, 4),
('Location5', 24.75, 50.80, 9.60, 5),
('Location6', 26.30, 62.15, 13.20, 6),
('Location7', 21.90, 57.40, 14.05, 7),
('Location8', 28.05, 49.75, 11.90, 8),
('Location9', 24.20, 53.60, 12.50, 9),
('Location10', 26.75, 61.80, 14.30, 10),
('Location11', 22.45, 59.20, 10.80, 11),
('Location12', 27.60, 48.95, 11.65, 12),
('Location13', 25.30, 55.75, 13.40, 13),
('Location14', 23.80, 63.10, 12.90, 14),
('Location15', 28.15, 51.20, 10.60, 15),
('Location16', 24.40, 58.65, 13.85, 16),
('Location17', 26.90, 54.30, 9.10, 17),
('Location18', 22.20, 61.85, 15.20, 18),
('Location19', 27.45, 49.60, 12.70, 19),
('Location20', 25.00, 52.75, 13.50, 20),
('Location21', 23.65, 60.45, 11.40, 21),
('Location22', 28.00, 47.80, 11.80, 22),
('Location23', 24.15, 56.25, 14.00, 23),
('Location24', 26.60, 52.10, 10.30, 24),
('Location25', 21.80, 64.30, 12.10, 25),
('Location26', 27.35, 50.45, 14.50, 26),
('Location27', 25.50, 54.90, 13.20, 27),
('Location28', 23.95, 59.75, 10.90, 28),
('Location29', 28.20, 46.60, 11.60, 29),
('Location30', 24.35, 57.15, 14.80, 30),
('Location31', 26.80, 51.40, 12.40, 31),
('Location32', 22.40, 63.75, 11.00, 32),
('Location33', 27.55, 48.90, 15.30, 33),
('Location34', 25.20, 53.20, 13.70, 34),
('Location35', 23.70, 60.85, 10.50, 35),
('Location36', 28.05, 45.70, 12.00, 36),
('Location37', 24.30, 58.25, 15.00, 37),
('Location38', 26.85, 50.60, 12.10, 38),
('Location39', 22.00, 62.95, 11.80, 39),
('Location40', 27.25, 47.20, 14.40, 40),
('Location41', 25.40, 52.50, 13.00, 41),
('Location42', 23.85, 60.15, 10.70, 42),
('Location43', 28.10, 45.90, 12.90, 43),
('Location44', 24.25, 57.65, 14.70, 44),
('Location45', 26.70, 50.30, 12.30, 45),
('Location46', 22.30, 62.55, 11.20, 46),
('Location47', 27.50, 47.80, 14.90, 47),
('Location48', 25.15, 53.05, 13.50, 48),
('Location49', 23.60, 61.20, 10.60, 49),
('Location50', 28.25, 45.40, 12.20, 50);



--QUERY NO.14
--HERE WE CREATE TABLE 'Infrastructure_Projects'

CREATE TABLE Infrastructure_Projects (
    Project_ID INT IDENTITY(1,1) PRIMARY KEY,
    Project_Name VARCHAR(255),
    Project_Type VARCHAR(255),
    Start_Date DATE,
    End_Date DATE,
    Budget DECIMAL(15,2),
    Ward_ID INT,
    Area_ID INT,
    FOREIGN KEY (Ward_ID) REFERENCES Ward(Ward_ID),
    FOREIGN KEY (Area_ID) REFERENCES Ward_info(Area_ID)
);


--QUERY NO.15
--HERE WE INSERT INTO 'Infrastructure_Projects'

INSERT INTO Infrastructure_Projects (Project_Name, Project_Type, Start_Date, End_Date, Budget, Ward_ID, Area_ID)
VALUES 
('Community Center Construction', 'Construction', '2022-01-15', '2023-06-30', 500000.00, 1, 1),
('Road Repair and Maintenance', 'Maintenance', '2021-03-10', '2021-12-20', 200000.00, 2, 1),
('New School Building', 'Construction', '2023-02-01', '2024-08-15', 1200000.00, 3, 2),
('Park Renovation', 'Renovation', '2022-05-20', '2023-01-10', 150000.00, 4, 3),
('Water Supply System Upgrade', 'Upgrade', '2021-07-01', '2022-07-01', 750000.00, 5, 4),
('Public Library Construction', 'Construction', '2022-11-10', '2023-10-20', 600000.00, 1, 2),
('Street Lighting Installation', 'Installation', '2023-03-15', '2023-09-25', 300000.00, 2, 3),
('Waste Management Facility', 'Construction', '2021-09-05', '2022-11-30', 800000.00, 3, 4),
('Community Health Center', 'Construction', '2023-06-01', '2024-12-31', 1000000.00, 4, 1),
('Public Transport Expansion', 'Expansion', '2022-04-10', '2023-12-15', 2000000.00, 5, 2);

SELECT * FROM Infrastructure_Projects




--QUERY NO.16
--HERE WE CREATE TABLE 'Businesses'


CREATE TABLE Businesses (
    Business_ID INT IDENTITY(1,1) PRIMARY KEY,
    Business_Name VARCHAR(255),
    Business_Type VARCHAR(255),
    Address VARCHAR(255),
    Ward_ID INT,
    Area_ID INT,
    FOREIGN KEY (Ward_ID) REFERENCES Ward(Ward_ID),
    FOREIGN KEY (Area_ID) REFERENCES Ward_info(Area_ID)
);


--QUERY NO.17
--HERE WE INSERT INTO 'Businesses'

INSERT INTO Businesses (Business_Name, Business_Type, Address, Ward_ID, Area_ID)
VALUES
('Green Grocers', 'Retail', '123 Main St', 1, 1),
('Tech Innovators', 'Technology', '456 Elm St', 2, 1),
('Blue Ocean Restaurant', 'Restaurant', '789 Maple Ave', 3, 2),
('Fitness First Gym', 'Fitness', '101 Oak St', 4, 3),
('Sunshine Pharmacy', 'Healthcare', '202 Pine St', 5, 4),
('Book Haven', 'Retail', '303 Cedar St', 1, 2),
('Auto Mechanics', 'Automotive', '404 Birch St', 2, 3),
('Creative Minds Studio', 'Art', '505 Willow St', 3, 4),
('Financial Solutions', 'Finance', '606 Spruce St', 4, 1),
('Happy Paws Pet Store', 'Retail', '707 Chestnut St', 5, 2);

SELECT * FROM Businesses





--QUERY NO.18
--HERE WE SHOW all the table

SELECT * FROM information_schema.tables WHERE table_type = 'BASE TABLE';


--QUERY NO.19
--HERE WE Search 'People' table with 'Date_of_Birth'

SELECT * FROM People WHERE Date_of_Birth = '1988-02-22';


--QUERY NO.20
--HERE SHOW People with Date_of_Birth BETWEEN two Dates

SELECT * FROM People WHERE Date_of_Birth BETWEEN '1988-02-22' AND '1995-03-03';


--QUERY NO.21
--HERE WE SHOW People whose Income is either MAXIMUM or MINIMUM

SELECT * FROM People WHERE Income = (SELECT MAX(Income) FROM People) OR Income = (SELECT MIN(Income) FROM People);


--QUERY NO.22
--HERE WE SHOW Vehicles which Model have the name 'c' in them

SELECT * FROM Vehicles
WHERE Vehicle_Model LIKE '%c%';



--QUERY NO.23
--HERE WE SHOW Vehicles of model 'Toyota' with Vehicle_Year in descending order

SELECT * FROM Vehicles
WHERE Vehicle_Make = 'Toyota'
ORDER BY Vehicle_Year DESC;


--QUERY NO.24
--HERE WE SHOW ALL Information of Ward and Ward_info combined

SELECT *
FROM Ward
INNER JOIN Ward_info ON Ward.Ward_ID = Ward_info.Ward_ID;


--QUERY NO.25
--HERE WE SHOW All table data show with related table
SELECT * FROM Ward
SELECT * FROM Ward_info
SELECT * FROM People
SELECT * FROM Buildings
SELECT * FROM Vehicles
SELECT * FROM EnvData


--QUERY NO.26
--HERE WE Find By Id/Unique Data/Name/Mobile/Email

SELECT * FROM People WHERE People_ID = 1; 

--QUERY NO.27
--HERE WE Find By Id with related Table Data

SELECT * FROM People
JOIN Ward ON People.Ward_ID = Ward.Ward_ID
JOIN Ward_info ON People.Area_ID = Ward_info.Area_ID
WHERE People_ID = 1; 

--QUERY NO.28
--HERE WE Show all reference with Join

SELECT * FROM Ward
JOIN Ward_info ON Ward.Ward_ID = Ward_info.Ward_ID
JOIN Buildings ON Ward.Ward_ID = Buildings.Ward_ID
JOIN Vehicles ON Buildings.Building_ID = Vehicles.Building_ID
JOIN EnvData ON Ward_info.Area_ID = EnvData.Area_ID
JOIN People ON Ward.Ward_ID = People.Ward_ID AND Ward_info.Area_ID = People.Area_ID;


--QUERY NO.29
--HERE WE Performed Date Search/Date wise Search

SELECT * FROM People WHERE Date_of_Birth = '1988-02-22';


--QUERY NO.30
--HERE WE Searched Date Between Search (Range)

SELECT * FROM People WHERE Date_of_Birth BETWEEN '1988-02-22' AND '1995-03-03';


--QUERY NO.31
--HERE WE Performed Total Amount wise search

SELECT * FROM People WHERE Income > 50000; 

--QUERY NO.32
--HERE WE Performed Max Min amount wise search

SELECT * FROM People WHERE Income = (SELECT MAX(Income) FROM People) OR Income = (SELECT MIN(Income) FROM People);

--QUERY NO.33
--HERE WE Performed Date and amount wise search

SELECT * FROM People WHERE Date_of_Birth = '2000-01-01' AND Income > 50000; 

--QUERY NO.34
--HERE WE Performed Order By Search

SELECT * FROM Vehicles
WHERE Vehicle_Make = 'Toyota'
ORDER BY Vehicle_Year DESC;

--QUERY NO.35
--HERE WE Performed Data Update, with join table

UPDATE People
SET First_Name = 'John', Last_Name = 'Doe'
WHERE People_ID IN (
    SELECT People_ID FROM People
    JOIN Ward ON People.Ward_ID = Ward.Ward_ID
    WHERE Ward_Name = 'Ward 1' 
);

--QUERY NO.36
--HERE WE COUNTED Total Data in a table

SELECT COUNT(*) FROM People;

--QUERY NO.37
--HERE WE Performed Like Search

SELECT * FROM People WHERE First_Name LIKE 'J%'; 

--QUERY NO.38
--HERE WE Performed Data insert 

INSERT INTO People (First_Name, Last_Name, Date_of_Birth, Gender, Occupation, Profession, Income, Marital_Status, Number_of_Children, Education_Level, Religion, Language_, National_ID, Ward_ID, Area_ID)
VALUES ('John', 'Doe', '1980-01-01', 'Male', 'Engineer', 'Software', 100000, 'Married', 2, 'PhD', 'Christianity', 'English', '123456789', 1, 1); 


