
DROP DATABASE IF EXISTS student_exam_db;

-- A. Database Creation (DDL)

-- Create database 
CREATE DATABASE student_exam_db;
USE student_exam_db;

-- Create tables 
-- Student table that stores basic student information
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    matric_no VARCHAR(20) UNIQUE NOT NULL,
    class_name VARCHAR(20) NOT NULL,  -- 6A
    gender ENUM('Male','Female') NOT NULL
);

-- Subject table that stores subjects offered
CREATE TABLE Subject (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_code VARCHAR(10) UNIQUE NOT NULL, -- BC,BM,BI,BT,RBT,ASK...
    subject_name VARCHAR(100) NOT NULL
);

-- Exam table that stores exam information for each subject
CREATE TABLE Exam (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_id INT NOT NULL,
	exam_type ENUM('Midterm','YearEnd') NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);

-- Result table that stores exam results
CREATE TABLE Result (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    exam_id INT NOT NULL,
    marks INT CHECK (marks BETWEEN 0 AND 100),
    grade VARCHAR(3) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id)
);


-- Delete table section
/**Create a temporary table tp store comment performance but database will
 shows performance using grades and CASE WHEN descriptions after this.So,the table was not needed and deleted
 **/
 
CREATE TABLE TempExamNotes (
    note_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    note_text VARCHAR(100)
);
SHOW TABLES;

-- Delete the table completely from the database
DROP TABLE TempExamNotes;
SHOW TABLES;

-- Alter table section
ALTER TABLE Student
ADD COLUMN phone VARCHAR(20);
SELECT * FROM Student;

-- B. Data Manipulation (DML)
-- Insert Student data (only focusing on Form 3 students)
-- Form 3 has 3 classes, each class consists of 15 students
INSERT INTO Student (student_name, matric_no, class_name, gender, phone) VALUES
-- CLASS 3A
('Aisyah binti Rahman', 'M0001', '3A', 'Female', '0123456701'),
('Nurul Huda binti Malik', 'M0002', '3A', 'Female', '0162234102'),
('Chua Jia Lin', 'M0003', '3A', 'Female', '0185541203'),
('Tan Mei Ling', 'M0004', '3A', 'Female', '0128814304'),
('Lim Yi Wen', 'M0005', '3A', 'Female', '0169902305'),
('Priya A/P Raman', 'M0006', '3A', 'Female', '0187728906'),
('Shalini A/P Kumar', 'M0007', '3A', 'Female', '0124498907'),
('Chong Ai Jin', 'M0008', '3A', 'Female', '0163187208'),
('Ahmad bin Razak', 'M0009', '3A', 'Male', '0181123409'),
('Muhammad Danish bin Zulkifli', 'M0010', '3A', 'Male', '0129982210'),
('Lim Jun Hao', 'M0011', '3A', 'Male', '0167729911'),
('Wong Zhi Hao', 'M0012', '3A', 'Male', '0183304412'),
('Arun A/L Kumar', 'M0013', '3A', 'Male', '0125519913'),
('Rajesh A/L Mani', 'M0014', '3A', 'Male', '0166642214'),
('Lee Wei Han', 'M0015', '3A', 'Male', '0188834415'),

-- CLASS 3B
('Lim Yu Han', 'M0016', '3B', 'Female', '0127716616'),
('Balqis binti Ariff', 'M0017', '3B', 'Female', '0162345617'),
('Nur Amira binti Rashid', 'M0018', '3B', 'Female', '0189872318'),
('Joanne Ching Yin Xuan', 'M0019', '3B', 'Female', '0127719919'),
('Tan Sze Ee', 'M0020', '3B', 'Female', '0168825520'),
('Kavitha A/P Selvam', 'M0021', '3B', 'Female', '0184431221'),
('Revathi A/P Ramesh', 'M0022', '3B', 'Female', '0123467522'),
('Chan Wai Mun', 'M0023', '3B', 'Female', '0169923323'),
('Hakim bin Abdullah', 'M0024', '3B', 'Male', '0185541124'),
('Syafiq bin Karim', 'M0025', '3B', 'Male', '0126614425'),
('Tan Wei Jie', 'M0026', '3B', 'Male', '0167235526'),
('Ng Kok Leong', 'M0027', '3B', 'Male', '0186649327'),
('Deepak A/L Rajan', 'M0028', '3B', 'Male', '0127719928'),
('Suresh A/L Muniandy', 'M0029', '3B', 'Male', '0165517829'),
('Goh Jian Ming', 'M0030', '3B', 'Male', '0183324430'),

-- CLASS 3C
('Evelyn Goh Yuan Qi', 'M0031', '3C', 'Female', '0122288831'),
('Farah binti Fauzi', 'M0032', '3C', 'Female', '0166622232'),
('Nurin binti Hasan', 'M0033', '3C', 'Female', '0188817333'),
('Lim Siew Ling', 'M0034', '3C', 'Female', '0124492234'),
('Ng Mei Yun', 'M0035', '3C', 'Female', '0167728835'),
('Anita A/P Raj', 'M0036', '3C', 'Female', '0186641136'),
('Sangeetha A/P Mohan', 'M0037', '3C', 'Female', '0125538837'),
('Tan Hui Qi', 'M0038', '3C', 'Female', '0167729938'),
('Irfan bin Musa', 'M0039', '3C', 'Male', '0181128839'),
('Zulkifli bin Omar', 'M0040', '3C', 'Male', '0127745340'),
('Wong Jian Hong', 'M0041', '3C', 'Male', '0168892241'),
('Lee Zhen Yang', 'M0042', '3C', 'Male', '0184412242'),
('Arvind A/L Nathan', 'M0043', '3C', 'Male', '0127711143'),
('Naveen A/L Kishore', 'M0044', '3C', 'Male', '0165527744'),
('Koh Wei Sheng', 'M0045', '3C', 'Male', '0183355545');

-- Insert Subject data (11 subjects)
INSERT INTO Subject (subject_code, subject_name) VALUES
('BM', 'Bahasa Melayu'),
('BI', 'Bahasa Inggeris'),
('BC', 'Bahasa Cina'),
('BT','Bahasa Tamil'),
('MM', 'Matematik'),
('SN', 'Sains'),
('SEJ', 'Sejarah'),
('GEO', 'Geografi'),
('ASK', 'Asas Sains Komputer'),
('RBT','Reka Bentuk dan Teknologi'),
('PI','Pendidikan Islam');

-- Insert Exam Data
-- Only 11 subjects, each with Midterm and YearEnd
INSERT INTO Exam (subject_id, exam_type) VALUES
(1, 'Midterm'), (1, 'YearEnd'), -- BM --
(2, 'Midterm'), (2, 'YearEnd'), -- BI --
(3, 'Midterm'), (3, 'YearEnd'), -- BC --
(4, 'Midterm'), (4, 'YearEnd'), -- BT --
(5, 'Midterm'), (5, 'YearEnd'), -- MM --
(6, 'Midterm'), (6, 'YearEnd'), -- SN --
(7, 'Midterm'), (7, 'YearEnd'), -- SEJ --
(8, 'Midterm'), (8, 'YearEnd'), -- GEO --
(9, 'Midterm'), (9, 'YearEnd'), -- RBT --
(10, 'Midterm'), (10, 'YearEnd'), -- ASK --
(11, 'Midterm'), (11, 'YearEnd'); -- PI --

-- Insert Result Data
-- Malay students take BM,BI,MM,SN,SEJ,GEO,RBT(3A,3B)/ASK(3C),PI
-- Indian students take BM,BI,BT,MM,SN,SEJ,GEO,RBT(3A,3B)/ASK(3C)
-- Chinese students take BM,BI,BC,MM,SN,SEJ,GEO,RBT(3A,3B)/ASK(3C)
-- Evaluation of grades based on UASA
-- A(82-100), B(66-81), C(50-65), D(35-49), E(20-34), F(0-19)
INSERT INTO Result (student_id, exam_id, marks, grade) VALUES
-- Malay students in class 3A, 3B
-- Student 1
(1, 1, 85, 'A'), (1, 2, 88, 'A'),
(1, 3, 78, 'B'), (1, 4, 80, 'B'),
(1, 9, 92, 'A'), (1, 10, 94, 'A'),
(1, 11, 65, 'C'), (1, 12, 68, 'B'),
(1, 13, 70, 'B'), (1, 14, 72, 'B'),
(1, 15, 85, 'A'), (1, 16, 88, 'A'),
(1, 19, 78, 'B'), (1, 20, 80, 'B'),
(1, 21, 92, 'A'), (1, 22, 94, 'A'),
-- Student 2
(2, 1, 76, 'B'), (2, 2, 88, 'A'),
(2, 3, 78, 'B'), (2, 4, 81, 'B'),
(2, 9, 83, 'A'), (2, 10, 88, 'B'),
(2, 11, 65, 'C'), (2, 12, 68, 'B'),
(2, 13, 72, 'B'), (2, 14, 77, 'B'),
(2, 15, 85, 'A'), (2, 16, 88, 'A'),
(2, 19, 35, 'D'), (2, 20, 50, 'C'),
(2, 21, 82, 'A'), (2, 22, 93, 'A'),
-- Student 9
(9, 1, 60, 'C'), (9, 2, 64, 'C'),
(9, 3, 77, 'B'), (9, 4, 80, 'B'),
(9, 9, 90, 'A'), (9, 10, 94, 'A'),
(9, 11, 64, 'C'), (9, 12, 69, 'B'),
(9, 13, 72, 'B'), (9, 14, 70, 'B'),
(9, 15, 25, 'E'), (9, 16, 35, 'D'),
(9, 19, 74, 'B'), (9, 20, 81, 'B'),
(9, 21, 97, 'A'), (9, 22, 98, 'A'),
-- Student 10
(10, 1, 79, 'B'), (10, 2, 82, 'A'),
(10, 3, 78, 'B'), (10, 4, 80, 'B'),
(10, 9, 42, 'D'), (10, 10, 55, 'C'),
(10, 11, 32, 'E'), (10, 12, 30, 'E'),
(10, 13, 13, 'F'), (10, 14, 33, 'E'),
(10, 15, 85, 'A'), (10, 16, 88, 'A'),
(10, 19, 55, 'C'), (10, 20, 64, 'C'),
(10, 21, 75, 'B'), (10, 22, 85, 'B'),
-- Student 17
(17, 1, 83, 'A'), (17, 2, 88, 'A'),
(17, 3, 78, 'B'), (17, 4, 81, 'B'),
(17, 9, 92, 'A'), (17, 10, 90, 'A'),
(17, 11, 62, 'C'), (17, 12, 68, 'B'),
(17, 13, 70, 'B'), (17, 14, 75, 'B'),
(17, 15, 85, 'A'), (17, 16, 83, 'A'),
(17, 19, 74, 'B'), (17, 20, 79, 'B'),
(17, 21, 92, 'A'), (17, 22, 92, 'A'),
-- Student 18
(18, 1, 85, 'A'), (18, 2, 88, 'A'),
(18, 3, 78, 'B'), (18, 4, 80, 'B'),
(18, 9, 72, 'B'), (18, 10, 74, 'B'),
(18, 11, 65, 'C'), (18, 12, 68, 'B'),
(18, 13, 70, 'B'), (18, 14, 82, 'A'),
(18, 15, 85, 'A'), (18, 16, 88, 'A'),
(18, 19, 65, 'C'), (18, 20, 80, 'B'),
(18, 21, 93, 'A'), (18, 22, 98, 'A'),
-- Student 24
(24, 1, 95, 'A'), (24, 2, 98, 'A'),
(24, 3, 72, 'B'), (24, 4, 79, 'B'),
(24, 9, 92, 'A'), (24, 10, 81, 'B'),
(24, 11, 65, 'C'), (24, 12, 68, 'B'),
(24, 13, 93, 'A'), (24, 14, 92, 'A'),
(24, 15, 83, 'A'), (24, 16, 86, 'A'),
(24, 19, 58, 'C'), (24, 20, 67, 'B'),
(24, 21, 94, 'A'), (24, 22, 92, 'A'),
-- Student 25
(25, 1, 77, 'B'), (25, 2, 82, 'A'),
(25, 3, 78, 'B'), (25, 4, 80, 'B'),
(25, 9, 37, 'D'), (25, 10, 44, 'D'),
(25, 11, 26, 'E'), (25, 12, 30, 'E'),
(25, 13, 70, 'B'), (25, 14, 72, 'B'),
(25, 15, 48, 'D'), (25, 16, 60, 'C'),
(25, 19, 78, 'B'), (25, 20, 80, 'B'),
(25, 21, 83, 'A'), (25, 22, 82, 'A'),
-- Malay students in class 3C
-- Student 32
(32, 1, 73, 'B'), (32, 2, 82, 'A'),
(32, 3, 78, 'B'), (32, 4, 81, 'B'),
(32, 9, 82, 'A'), (32, 10, 85, 'B'),
(32, 11, 65, 'C'), (32, 12, 80, 'B'),
(32, 13, 72, 'B'), (32, 14, 77, 'B'),
(32, 15, 83, 'A'), (32, 16, 91, 'A'),
(32, 17, 45, 'D'), (32, 18, 52, 'C'),
(32, 21, 84, 'A'), (32, 22, 90, 'A'),
-- Student 33
(33, 1, 60, 'C'), (33, 2, 64, 'C'),
(33, 3, 77, 'B'), (33, 4, 80, 'B'),
(33, 9, 90, 'A'), (33, 10, 94, 'A'),
(33, 11, 64, 'C'), (33, 12, 69, 'B'),
(33, 13, 72, 'B'), (33, 14, 70, 'B'),
(33, 15, 25, 'E'), (33, 16, 35, 'D'),
(33, 17, 74, 'B'), (33, 18, 81, 'B'),
(33, 21, 97, 'A'), (33, 22, 98, 'A'),
-- Student 39
(39, 1, 79, 'B'), (39, 2, 82, 'A'),
(39, 3, 79, 'B'), (39, 4, 73, 'B'),
(39, 9, 42, 'D'), (39, 10, 55, 'C'),
(39, 11, 32, 'E'), (39, 12, 30, 'E'),
(39, 13, 19, 'F'), (39, 14, 26, 'E'),
(39, 15, 85, 'A'), (39, 16, 88, 'A'),
(39, 17, 65, 'C'), (39, 18, 64, 'C'),
(39, 21, 75, 'B'), (39, 22, 81, 'B'),
-- Student 40
(40, 1, 83, 'A'), (40, 2, 88, 'A'),
(40, 3, 85, 'A'), (40, 4, 86, 'A'),
(40, 9, 82, 'A'), (40, 10, 87, 'A'),
(40, 11, 93, 'A'), (40, 12, 98, 'A'),
(40, 13, 90, 'A'), (40, 14, 95, 'A'),
(40, 15, 85, 'A'), (40, 16, 83, 'A'),
(40, 17, 84, 'A'), (40, 18, 85, 'A'),
(40, 21, 90, 'A'), (40, 22, 89, 'A'),
-- Indian students in class 3A, 3B
-- Student 6
(6, 1, 55, 'C'), (6, 2, 58, 'C'),
(6, 3, 78, 'B'), (6, 4, 80, 'B'),
(6, 7, 88, 'A'), (6, 8, 90, 'A'),
(6, 9, 63, 'C'), (6, 10, 63, 'C'),
(6, 11, 40, 'D'), (6, 12, 42, 'D'),
(6, 13, 31, 'E'), (6, 14, 30, 'E'),
(6, 15, 27, 'E'), (6, 16, 41, 'D'),
(6, 19, 42, 'D'), (6, 20, 50, 'C'),
-- Student 7
(7, 1, 85, 'A'), (7, 2, 88, 'A'),
(7, 3, 78, 'B'), (7, 4, 80, 'B'),
(7, 7, 18, 'F'), (7, 8, 26, 'E'),
(7, 9, 65, 'C'), (7, 10, 68, 'B'),
(7, 11, 70, 'B'), (7, 12, 72, 'B'),
(7, 13, 85, 'A'), (7, 14, 88, 'A'),
(7, 15, 78, 'B'), (7, 16, 80, 'B'),
(7, 19, 39, 'D'), (7, 20, 33, 'E'),
-- Student 13
(13, 1, 40, 'D'), (13, 2, 34, 'E'),
(13, 3, 48, 'D'), (13, 4, 56, 'C'),
(13, 7, 62, 'C'), (13, 8, 64, 'C'),
(13, 9, 65, 'C'), (13, 10, 70, 'B'),
(13, 11, 51, 'C'), (13, 12, 47, 'D'),
(13, 13, 40, 'D'), (13, 14, 46, 'D'),
(13, 15, 58, 'C'), (13, 16, 60, 'C'),
(13, 19, 39, 'D'), (13, 20, 52, 'C'),
-- Student 14
(14, 1, 85, 'A'), (14, 2, 88, 'A'),
(14, 3, 78, 'B'), (14, 4, 80, 'B'),
(14, 7, 92, 'A'), (14, 8, 94, 'A'),
(14, 9, 65, 'C'), (14, 10, 68, 'B'),
(14, 11, 70, 'B'), (14, 12, 72, 'B'),
(14, 13, 85, 'A'), (14, 14, 88, 'A'),
(14, 15, 78, 'B'), (14, 16, 80, 'B'),
(14, 19, 92, 'A'), (14, 20, 94, 'A'),
-- Student 16
(16, 1, 95, 'A'), (16, 2, 98, 'A'),
(16, 3, 77, 'B'), (16, 4, 80, 'B'),
(16, 7, 96, 'A'), (16, 8, 90, 'A'),
(16, 9, 60, 'C'), (16, 10, 59, 'C'),
(16, 11, 70, 'B'), (16, 12, 76, 'B'),
(16, 13, 82, 'A'), (16, 14, 83, 'A'),
(16, 15, 80, 'B'), (16, 16, 76, 'B'),
(16, 19, 86, 'A'), (16, 20, 90, 'A'),
-- Student 21
(21, 1, 85, 'A'), (21, 2, 88, 'A'),
(21, 3, 78, 'B'), (21, 4, 80, 'B'),
(21, 7, 92, 'A'), (21, 8, 94, 'A'),
(21, 9, 65, 'C'), (21, 10, 68, 'B'),
(21, 11, 70, 'B'), (21, 12, 72, 'B'),
(21, 13, 95, 'A'), (21, 14, 100, 'A'),
(21, 15, 78, 'B'), (21, 16, 80, 'B'),
(21, 19, 92, 'A'), (21, 20, 94, 'A'),
-- Student 22
(22, 1, 75, 'B'), (22, 2, 78, 'B'),
(22, 3, 78, 'B'), (22, 4, 70, 'B'),
(22, 7, 72, 'B'), (22, 8, 74, 'B'),
(22, 9, 60, 'C'), (22, 10, 68, 'B'),
(22, 11, 74, 'B'), (22, 12, 74, 'B'),
(22, 13, 85, 'A'), (22, 14, 78, 'B'),
(22, 15, 75, 'B'), (22, 16, 81, 'B'),
(22, 19, 90, 'A'), (22, 20, 84, 'A'),
-- Student 28
(28, 1, 85, 'A'), (28, 2, 88, 'A'),
(28, 3, 78, 'B'), (28, 4, 80, 'B'),
(28, 7, 92, 'A'), (28, 8, 94, 'A'),
(28, 9, 65, 'C'), (28, 10, 68, 'B'),
(28, 11, 70, 'B'), (28, 12, 72, 'B'),
(28, 13, 100, 'A'), (28, 14, 98, 'A'),
(28, 15, 78, 'B'), (28, 16, 80, 'B'),
(28, 19, 92, 'A'), (28, 20, 94, 'A'),
-- Student 29
(29, 1, 39, 'D'), (29, 2, 53, 'C'),
(29, 3, 48, 'D'), (29, 4, 50, 'C'),
(29, 7, 36, 'D'), (29, 8, 44, 'D'),
(29, 9, 65, 'C'), (29, 10, 63, 'C'),
(29, 11, 50, 'C'), (29, 12, 62, 'C'),
(29, 13, 55, 'C'), (29, 14, 58, 'C'),
(29, 15, 58, 'C'), (29, 16, 62, 'C'),
(29, 19, 72, 'B'), (29, 20, 81, 'B'),
-- Indian students in class 3C
-- Student 36
(36, 1, 53, 'C'), (36, 2, 62, 'C'),
(36, 3, 78, 'B'), (36, 4, 81, 'B'),
(36, 7, 63, 'C'), (36, 8, 61, 'C'),
(36, 9, 62, 'C'), (36, 10, 75, 'B'),
(36, 11, 73, 'B'), (36, 12, 60, 'C'),
(36, 13, 66, 'B'), (36, 14, 62, 'C'),
(36, 15, 66, 'B'), (36, 16, 54, 'C'),
(36, 17, 48, 'D'), (36, 18, 55, 'C'),
-- Student 37
(37, 1, 70, 'B'), (37, 2, 83, 'A'),
(37, 3, 48, 'D'), (37, 4, 61, 'C'),
(37, 7, 79, 'B'), (37, 8, 80, 'B'),
(37, 9, 52, 'C'), (37, 10, 45, 'D'),
(37, 11, 35, 'D'), (37, 12, 46, 'D'),
(37, 13, 63, 'C'), (37, 14, 70, 'B'),
(37, 15, 63, 'B'), (37, 16, 71, 'B'),
(37, 17, 48, 'D'), (37, 18, 51, 'C'),
-- Student 43
(43, 1, 80, 'B'), (43, 2, 83, 'A'),
(43, 3, 78, 'B'), (43, 4, 71, 'B'),
(43, 7, 68, 'B'), (43, 8, 74, 'B'),
(43, 9, 32, 'E'), (43, 10, 34, 'E'),
(43, 11, 15, 'F'), (43, 12, 30, 'E'),
(43, 13, 71, 'B'), (43, 14, 62, 'C'),
(43, 15, 33, 'E'), (43, 16, 31, 'E'),
(43, 17, 25, 'E'), (43, 18, 33, 'E'),
-- Student 44
(44, 1, 66, 'B'), (44, 2, 82, 'A'),
(44, 3, 69, 'B'), (44, 4, 75, 'B'),
(44, 7, 71, 'B'), (44, 8, 79, 'B'),
(44, 9, 86, 'A'), (44, 10, 81, 'B'),
(44, 11, 65, 'C'), (44, 12, 75, 'B'),
(44, 13, 68, 'B'), (44, 14, 77, 'B'),
(44, 15, 86, 'A'), (44, 16, 97, 'A'),
(44, 17, 75, 'B'), (44, 18, 80, 'B'),
-- Chinese students in class 3A, 3B
-- Student 3
(3, 1, 80, 'A'), (3, 2, 85, 'A'),
(3, 3, 68, 'B'), (3, 4, 81, 'B'),
(3, 5, 73, 'B'), (3, 6, 80, 'B'),
(3, 9, 89, 'A'), (3, 10, 93, 'A'),
(3, 11, 55, 'C'), (3, 12, 67, 'B'),
(3, 13, 71, 'B'), (3, 14, 77, 'B'),
(3, 15, 89, 'A'), (3, 16, 86, 'A'),
(3, 19, 74, 'B'), (3, 20, 70, 'B'),
-- Student 4
(4, 1, 86, 'A'), (4, 2, 88, 'A'),
(4, 3, 68, 'B'), (4, 4, 84, 'A'),
(4, 5, 83, 'A'), (4, 6, 81, 'B'),
(4, 9, 88, 'A'), (4, 10, 78, 'B'),
(4, 11, 85, 'A'), (4, 12, 71, 'B'),
(4, 13, 76, 'B'), (4, 14, 80, 'B'),
(4, 15, 85, 'A'), (4, 16, 88, 'A'),
(4, 19, 75, 'B'), (4, 20, 82, 'A'),
-- Student 5
(5, 1, 90, 'A'), (5, 2, 94, 'A'),
(5, 3, 97, 'A'), (5, 4, 90, 'A'),
(5, 5, 98, 'A'), (5, 6, 90, 'A'),
(5, 9, 90, 'A'), (5, 10, 94, 'A'),
(5, 11, 94, 'A'), (5, 12, 99, 'A'),
(5, 13, 92, 'A'), (5, 14, 90, 'A'),
(5, 15, 95, 'A'), (5, 16, 95, 'A'),
(5, 19, 84, 'A'), (5, 20, 91, 'A'),
-- Student 8
(8, 1, 79, 'B'), (8, 2, 85, 'A'),
(8, 3, 73, 'B'), (8, 4, 70, 'B'),
(8, 5, 68, 'B'), (8, 6, 70, 'B'),
(8, 9, 48, 'D'), (8, 10, 56, 'C'),
(8, 11, 62, 'C'), (8, 12, 70, 'B'),
(8, 13, 73, 'B'), (8, 14, 73, 'B'),
(8, 15, 87, 'A'), (8, 16, 78, 'B'),
(8, 19, 66, 'B'), (8, 20, 69, 'B'),
-- Student 11
(11, 1, 96, 'A'), (11, 2, 100, 'A'),
(11, 3, 78, 'B'), (11, 4, 81, 'B'),
(11, 5, 78, 'B'), (11, 6, 80, 'B'),
(11, 9, 92, 'A'), (11, 10, 90, 'A'),
(11, 11, 62, 'C'), (11, 12, 68, 'B'),
(11, 13, 70, 'B'), (11, 14, 75, 'B'),
(11, 15, 85, 'A'), (11, 16, 83, 'A'),
(11, 19, 74, 'B'), (11, 20, 79, 'B'),
-- Student 12
(12, 1, 85, 'A'), (12, 2, 88, 'A'),
(12, 3, 78, 'B'), (12, 4, 80, 'B'),
(12, 5, 78, 'B'), (12, 6, 80, 'B'),
(12, 9, 72, 'B'), (12, 10, 74, 'B'),
(12, 11, 65, 'C'), (12, 12, 68, 'B'),
(12, 13, 70, 'B'), (12, 14, 82, 'A'),
(12, 15, 85, 'A'), (12, 16, 88, 'A'),
(12, 19, 65, 'C'), (12, 20, 80, 'B'),
-- Student 15
(15, 1, 95, 'A'), (15, 2, 98, 'A'),
(15, 3, 72, 'B'), (15, 4, 79, 'B'),
(15, 5, 78, 'B'), (15, 6, 80, 'B'),
(15, 9, 92, 'A'), (15, 10, 81, 'B'),
(15, 11, 65, 'C'), (15, 12, 68, 'B'),
(15, 13, 93, 'A'), (15, 14, 92, 'A'),
(15, 15, 83, 'A'), (15, 16, 86, 'A'),
(15, 19, 58, 'C'), (15, 20, 67, 'B'),
-- Student 19
(19, 1, 77, 'B'), (19, 2, 82, 'A'),
(19, 3, 78, 'B'), (19, 4, 80, 'B'),
(19, 5, 58, 'C'), (19, 6, 61, 'C'),
(19, 9, 57, 'C'), (19, 10, 60, 'C'),
(19, 11, 46, 'D'), (19, 12, 60, 'D'),
(19, 13, 70, 'B'), (19, 14, 72, 'B'),
(19, 15, 48, 'D'), (19, 16, 53, 'C'),
(19, 19, 78, 'B'), (19, 20, 80, 'B'),
-- Student 20
(20, 1, 40, 'D'), (20, 2, 34, 'E'),
(20, 3, 48, 'D'), (20, 4, 56, 'C'),
(20, 5, 62, 'C'), (20, 6, 64, 'C'),
(20, 9, 65, 'C'), (20, 10, 70, 'B'),
(20, 11, 51, 'C'), (20, 12, 47, 'D'),
(20, 13, 40, 'D'), (20, 14, 46, 'D'),
(20, 15, 58, 'C'), (20, 16, 60, 'C'),
(20, 19, 39, 'D'), (20, 20, 52, 'C'),
-- Student 23
(23, 1, 85, 'A'), (23, 2, 88, 'A'),
(23, 3, 78, 'B'), (23, 4, 80, 'B'),
(23, 5, 92, 'A'), (23, 6, 94, 'A'),
(23, 9, 65, 'C'), (23, 10, 68, 'B'),
(23, 11, 70, 'B'), (23, 12, 72, 'B'),
(23, 13, 85, 'A'), (23, 14, 88, 'A'),
(23, 15, 78, 'B'), (23, 16, 80, 'B'),
(23, 19, 92, 'A'), (23, 20, 94, 'A'),
-- Student 26
(26, 1, 95, 'A'), (26, 2, 98, 'A'),
(26, 3, 77, 'B'), (26, 4, 80, 'B'),
(26, 5, 96, 'A'), (26, 6, 90, 'A'),
(26, 9, 60, 'C'), (26, 10, 59, 'C'),
(26, 11, 70, 'B'), (26, 12, 76, 'B'),
(26, 13, 82, 'A'), (26, 14, 83, 'A'),
(26, 15, 80, 'B'), (26, 16, 76, 'B'),
(26, 19, 86, 'A'), (26, 20, 90, 'A'),
-- Student 27
(27, 1, 85, 'A'), (27, 2, 88, 'A'),
(27, 3, 78, 'B'), (27, 4, 80, 'B'),
(27, 5, 92, 'A'), (27, 6, 94, 'A'),
(27, 9, 65, 'C'), (27, 10, 68, 'B'),
(27, 11, 70, 'B'), (27, 12, 72, 'B'),
(27, 13, 85, 'A'), (27, 14, 88, 'A'),
(27, 15, 78, 'B'), (27, 16, 80, 'B'),
(27, 19, 92, 'A'), (27, 20, 94, 'A'),
-- Student 30
(30, 1, 89, 'A'), (30, 2, 94, 'A'),
(30, 3, 71, 'B'), (30, 4, 78, 'B'),
(30, 5, 92, 'A'), (30, 6, 99, 'A'),
(30, 9, 61, 'C'), (30, 10, 69, 'B'),
(30, 11, 75, 'B'), (30, 12, 78, 'B'),
(30, 13, 85, 'A'), (30, 14, 88, 'A'),
(30, 15, 68, 'B'), (30, 16, 75, 'B'),
(30, 19, 91, 'A'), (30, 20, 98, 'A'),
-- Chinese students in class 3C
-- Student 31
(31, 1, 60, 'C'), (31, 2, 65, 'C'),
(31, 3, 58, 'C'), (31, 4, 61, 'C'),
(31, 5, 53, 'C'), (31, 6, 70, 'B'),
(31, 9, 79, 'B'), (31, 10, 73, 'B'),
(31, 11, 65, 'C'), (31, 12, 69, 'C'),
(31, 13, 51, 'C'), (31, 14, 60, 'C'),
(31, 15, 74, 'B'), (31, 16, 81, 'B'),
(31, 17, 80, 'B'), (31, 18, 92, 'A'),
-- Student 34
(34, 1, 56, 'C'), (34, 2, 68, 'B'),
(34, 3, 70, 'B'), (34, 4, 66, 'B'),
(34, 5, 73, 'B'), (34, 6, 82, 'A'),
(34, 9, 88, 'A'), (34, 10, 98, 'B'),
(34, 11, 47, 'D'), (34, 12, 65, 'C'),
(34, 13, 39, 'D'), (34, 14, 46, 'D'),
(34, 15, 55, 'C'), (34, 16, 58, 'D'),
(34, 17, 56, 'C'), (34, 18, 61, 'C'),
-- Student 35
(35, 1, 80, 'A'), (35, 2, 84, 'A'),
(35, 3, 87, 'A'), (35, 4, 90, 'A'),
(35, 5, 88, 'A'), (35, 6, 92, 'A'),
(35, 9, 90, 'A'), (35, 10, 84, 'A'),
(35, 11, 90, 'A'), (35, 12, 86, 'A'),
(35, 13, 92, 'A'), (35, 14, 99, 'A'),
(35, 15, 98, 'A'), (35, 16, 100, 'A'),
(35, 17, 94, 'A'), (35, 18, 94, 'A'),
-- Student 38
(38, 1, 79, 'B'), (38, 2, 84, 'A'),
(38, 3, 73, 'B'), (38, 4, 80, 'B'),
(38, 5, 68, 'B'), (38, 6, 77, 'B'),
(38, 9, 37, 'D'), (38, 10, 52, 'C'),
(38, 11, 64, 'C'), (38, 12, 68, 'B'),
(38, 13, 79, 'B'), (38, 14, 81, 'B'),
(38, 15, 94, 'A'), (38, 16, 80, 'B'),
(38, 17, 69, 'B'), (38, 18, 74, 'B'),
-- Student 41
(41, 1, 83, 'A'), (41, 2, 88, 'A'),
(41, 3, 78, 'B'), (41, 4, 81, 'B'),
(41, 5, 78, 'B'), (41, 6, 80, 'B'),
(41, 9, 92, 'A'), (41, 10, 90, 'A'),
(41, 11, 62, 'C'), (41, 12, 68, 'B'),
(41, 13, 70, 'B'), (41, 14, 75, 'B'),
(41, 15, 85, 'A'), (41, 16, 83, 'A'),
(41, 17, 74, 'B'), (41, 18, 79, 'B'),
-- Student 42
(42, 1, 82, 'A'), (42, 2, 82, 'A'),
(42, 3, 78, 'B'), (42, 4, 80, 'B'),
(42, 5, 78, 'B'), (42, 6, 80, 'B'),
(42, 9, 72, 'B'), (42, 10, 74, 'B'),
(42, 11, 65, 'C'), (42, 12, 68, 'B'),
(42, 13, 70, 'B'), (42, 14, 82, 'A'),
(42, 15, 85, 'A'), (42, 16, 88, 'A'),
(42, 17, 60, 'C'), (42, 18, 66, 'B'),
-- Student 45
(45, 1, 95, 'A'), (45, 2, 98, 'A'),
(45, 3, 72, 'B'), (45, 4, 79, 'B'),
(45, 5, 68, 'B'), (45, 6, 75, 'B'),
(45, 9, 92, 'A'), (45, 10, 81, 'B'),
(45, 11, 65, 'C'), (45, 12, 68, 'B'),
(45, 13, 93, 'A'), (45, 14, 98, 'A'),
(45, 15, 83, 'A'), (45, 16, 86, 'A'),
(45, 17, 55, 'C'), (45, 18, 68, 'B');

-- Students before changes
SELECT * FROM Student;

UPDATE Student
SET student_name = 'Aisyah binti Razak'
WHERE matric_no = 'M0001';

DELETE FROM Student
WHERE matric_no = 'M0045';

-- Students after changes
SELECT * FROM Student;
SELECT * FROM Result; -- 44 * 16 = 704 rows of result

-- C. Data Retrieval (DQL / SELECT)
-- Filtering (WHERE, AND, OR, NOT, BETWEEN, LIKE, NULL).

-- 1.WHERE and AND: Filter Male students in class "3A"
SELECT student_name, class_name, gender
FROM Student
WHERE class_name = '3A' AND gender = 'Male';

-- 2.OR: Filter students who scored grade A or B for Mathematics and Science 
--       (Suitable for Science Stream)
SELECT 
    s.student_name,
    sub.subject_name,
    r.grade
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE (r.grade = 'A' OR r.grade = 'B')
  AND sub.subject_name IN ('Matematik', 'Sains');

-- 3.NOT: Filter subjects that are not language subjects
SELECT subject_code, subject_name
FROM Subject
WHERE NOT subject_code IN ('BM', 'BI', 'BC','BT');

-- 4.BETWEEN: Filter students with borderline marks for each subjects
SELECT 
    s.student_name,
    sub.subject_name,
    r.marks
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE r.marks BETWEEN 40 AND 55;

-- 5.LIKE: Filter students name that begins with "A"
SELECT student_name, matric_no
FROM Student
WHERE student_name LIKE 'A%';

-- 6.NULL: Find students with missing any exam results
SELECT 
    s.student_name,
    sub.subject_name,
    e.exam_type
FROM Student s
JOIN Exam e ON TRUE
JOIN Subject sub ON e.subject_id = sub.subject_id
LEFT JOIN Result r 
    ON r.student_id = s.student_id 
    AND r.exam_id = e.exam_id
WHERE r.result_id IS NULL;

-- Sorting (ORDER BY, LIMIT).
-- Sort students by alphabetic order
SELECT student_name, class_name
FROM Student
ORDER BY student_name ASC;

-- Sort Top 5 students' marks for BM Only 
SELECT 
    s.student_name,
    s.class_name,
    r.marks
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE sub.subject_code = 'BM'
ORDER BY r.marks DESC
LIMIT 5;


-- Aggregation (COUNT, SUM, AVG, MAX, MIN)
-- COUNT total number of students by class
SELECT class_name, COUNT(*) AS total_students
FROM Student
GROUP BY class_name;

-- Get total marks for each students using SUM
SELECT s.student_id, s.matric_no, s.student_name, s.class_name, SUM(r.marks) AS total_marks
FROM Result r
JOIN Student s ON r.student_id = s.student_id
GROUP BY s.student_id;

-- Get average marks for each students using AVG
SELECT s.student_id, s.matric_no, s.student_name, s.class_name, ROUND(AVG(r.marks),2) AS average_marks
FROM Result r
JOIN Student s ON r.student_id = s.student_id
GROUP BY s.student_id;

-- Get highest mark for BM
SELECT MAX(r.marks) AS highest_BM
FROM Result r
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE sub.subject_code = 'BM';

-- Get lowest mark for SEJ
SELECT MIN(r.marks) AS lowest_SEJ
FROM Result r
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE sub.subject_code = 'SEJ';

-- Grouping and filtering groups (GROUP BY, HAVING). 
-- 1. GROUP BY with HAVING: Find classes with average marks > 70 in all subjects
SELECT 
    s.class_name,
    sub.subject_name,
    ROUND(AVG(r.marks), 2) AS average_marks
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
GROUP BY s.class_name, sub.subject_name
HAVING AVG(r.marks) > 70;

-- 2.GROUP BY with HAVING: Find subjects where less than 10 students scored grade 'A'
SELECT
    sub.subject_name,
    COUNT(*) AS grade_a_count
FROM Result r
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE r.grade = 'A'
GROUP BY sub.subject_name
HAVING COUNT(*) < 10;

-- Explanation: "This query helps teachers identify which subjects have fewer high achievers, 
-- 				allowing them to focus on improving teaching methods for those subjects."


-- Numeric and string functions (ROUND, TRUNCATE, UPPER, LENGTH, CONCAT, SUBSTR). 
-- 1.ROUND: Calculate average marks rounded to 2 decimal places for each subject
SELECT
    sub.subject_name,
    ROUND(AVG(r.marks), 2) AS average_marks
FROM Result r
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
GROUP BY sub.subject_name;

-- 2.TRUNCATE: Calculate average marks truncated to 1 decimal place
SELECT
    sub.subject_name,
    TRUNCATE(AVG(r.marks), 1) AS truncated_average_marks
FROM Result r
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
GROUP BY sub.subject_name;

-- 3.UPPER: Display all subject names in uppercase
SELECT
    UPPER(subject_name) AS subject_name_upper,
    subject_code
FROM Subject;

-- 4.LENGTH: Find student names with more than 15 characters
SELECT
    student_name,
    LENGTH(student_name) AS name_length
FROM Student
WHERE LENGTH(student_name) > 15
ORDER BY name_length DESC;

-- 5.CONCAT: Create student info with formatted display
SELECT
    CONCAT(student_name, ' (', matric_no, ') -  Class: ', class_name) AS student_info,
    gender
FROM Student;

-- Explanation: "CONCAT allows us to create user-friendly displays 
-- 				by combining multiple columns into formatted output."


-- 6.SUBSTR: Extract first 3 characters of matric number to identify batch
SELECT
    student_name,
    matric_no,
    SUBSTR(matric_no, 1, 3) AS batch_code
FROM Student;

-- 7.SUBSTR: Create student email using first name and matric number
SELECT 
    student_name,
    matric_no,
    CONCAT(
        LOWER(SUBSTR(student_name, 1, LOCATE(' ', student_name) - 1)),
        SUBSTR(matric_no, 2),
        '@school.edu.my'
    ) AS suggested_email
FROM Student;

-- Conditional logic (CASE WHEN)
-- Assign performance category based on grade for Class 3A students in Year-End Sains exam
SELECT 
    s.student_name,
    sub.subject_name,
    r.grade,
    CASE r.grade
        WHEN 'A' THEN 'Excellent'
        WHEN 'B' THEN 'Commendable'
        WHEN 'C' THEN 'Good'
        WHEN 'D' THEN 'Satisfactory'
        WHEN 'E' THEN 'Achieving the Minimum Level'
        WHEN 'F' THEN 'Not Achieving the Minimum Level'
        ELSE 'Unknown'
    END AS performance_description
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE s.class_name = '3A'
  AND e.exam_type = 'YearEnd'
  AND sub.subject_name = 'Sains';

-- Subqueries (single-row, multiple-row, correlated)
-- 1.Single-row subquery: Find students who scored highest in BM
SELECT s.student_name, r.marks
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE sub.subject_code = 'BM'
  AND r.marks = (SELECT MAX(r2.marks)
                 FROM Result r2
                 JOIN Exam e2 ON r2.exam_id = e2.exam_id
                 JOIN Subject sub2 ON e2.subject_id = sub2.subject_id
                 WHERE sub2.subject_code = 'BM');

-- 2.Multiple-row subquery: Find students who scored grade 'A' in Mathematics or Science for Year End exam
SELECT s.student_name, sub.subject_name, r.grade
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE r.grade = 'A'
  AND sub.subject_code IN (
      SELECT subject_code
      FROM Subject
      WHERE subject_name IN ('Matematik', 'Sains')
  )
  AND e.exam_type = 'YearEnd';

-- 3.Correlated subquery: Students in Class 3A who scored above average in Matematik for YearEnd exam
SELECT s.student_name, s.class_name, sub.subject_name, r.marks
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE s.class_name = '3A'
  AND sub.subject_name = 'Matematik'
  AND e.exam_type = 'YearEnd'
  AND r.marks > (
      SELECT AVG(r2.marks)
      FROM Result r2
      JOIN Student s2 ON r2.student_id = s2.student_id
      JOIN Exam e2 ON r2.exam_id = e2.exam_id
      JOIN Subject sub2 ON e2.subject_id = sub2.subject_id
      WHERE s2.class_name = s.class_name
        AND sub2.subject_name = 'Matematik'
        AND e2.exam_type = 'YearEnd'
  );

-- Set operations (UNION, NOT EXISTs)
-- 1.UNION: List all students in 3A and 3B (without duplicates)
SELECT student_name, class_name FROM Student WHERE class_name = '3A'
UNION
SELECT student_name, class_name FROM Student WHERE class_name = '3B';


-- 2. NOT EXISTS: Find students who never scored grade 'F'
SELECT s.student_name
FROM Student s
WHERE NOT EXISTS (
    SELECT 1
    FROM Result r
    WHERE r.student_id = s.student_id
      AND r.grade = 'F'
);

-- Joins (NATURAL, INNER, LEFT OUTER, SELF)
-- 1.NATURAL JOIN: Show student marks with subject info
SELECT student_name, subject_name,exam_type, marks, grade
FROM Student
NATURAL JOIN Result
NATURAL JOIN Exam
NATURAL JOIN Subject;

-- 2.INNER JOIN: List students with marks for Science stream subjects (YearEnd exam only)
SELECT 
    s.student_name,
    s.class_name,
    sub.subject_name,
    e.exam_type,
    r.marks,
    r.grade
FROM Result r
INNER JOIN Student s ON r.student_id = s.student_id
INNER JOIN Exam e ON r.exam_id = e.exam_id
INNER JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE sub.subject_name IN ('Matematik', 'Sains')
  AND e.exam_type = 'YearEnd'
ORDER BY s.student_name, sub.subject_name;

-- 3. LEFT OUTER JOIN: Show all students in Class 3A and their YearEnd Matematik marks (including missing)
SELECT 
    s.student_name,
    s.class_name,
    r.marks,
    r.grade
FROM Student s
LEFT JOIN Result r 
    ON s.student_id = r.student_id
LEFT JOIN Exam e 
    ON r.exam_id = e.exam_id
LEFT JOIN Subject sub 
    ON e.subject_id = sub.subject_id
WHERE s.class_name = '3A'
  AND ((sub.subject_name = 'Matematik' AND e.exam_type = 'YearEnd') OR sub.subject_name IS NULL)
ORDER BY s.student_name;

-- 4.SELF JOIN: Compare students in Class 3A for YearEnd Matematik exam
SELECT 
    s1.student_name AS student1,
    s2.student_name AS student2,
    a.marks AS marks1,
    b.marks AS marks2
FROM Result a
JOIN Result b 
    ON a.exam_id = b.exam_id
    AND a.student_id <> b.student_id  -- avoid comparing same student
JOIN Student s1 ON a.student_id = s1.student_id
JOIN Student s2 ON b.student_id = s2.student_id
JOIN Exam e ON a.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE s1.class_name = '3A'
  AND s2.class_name = '3A'
  AND e.exam_type = 'YearEnd'
  AND sub.subject_name = 'Matematik'
  AND a.marks > b.marks
ORDER BY a.marks DESC, s1.student_name;

-- D. Indexing and Optimization
-- Create two indexes: BTREE (for numeric/date columns) and TEXT (for text search)

-- Analyse query plans before and after index creation
-- PART 1: Before Indexing - Show current performance

-- Query 1: Find students with marks between 70 and 85 (uses BTREE index)
EXPLAIN SELECT 
    s.student_name,
    sub.subject_name,
    r.marks,
    r.grade
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE r.marks BETWEEN 70 AND 85
ORDER BY r.marks DESC;

-- Query 2: Search students by FULLTEXT pattern (uses TEXT index)
EXPLAIN SELECT
    student_name,
    class_name,
    gender
FROM Student
WHERE student_name LIKE 'Lim%';

-- Query 3: Identify high-achieving students
EXPLAIN SELECT 
    s.student_name,
    s.class_name,
    sub.subject_name,
    AVG(r.marks) AS avg_marks
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE r.marks > 50
GROUP BY s.student_id, sub.subject_id
HAVING AVG(r.marks) > 70
ORDER BY avg_marks DESC;

-- PART 2: Create Index
-- BTREE Index on marks column for faster mark-based queries
CREATE INDEX idx_marks_btree ON Result(marks) USING BTREE;
-- TEXT Index on student_name for faster text searches
CREATE FULLTEXT INDEX idx_student_name_text ON Student(student_name);
-- Additional indexes for optimization
CREATE INDEX idx_student_class ON Student(class_name);
CREATE INDEX idx_exam_subject ON Exam(subject_id);
CREATE INDEX idx_result_student_exam ON Result(student_id,exam_id);

-- PART 3: AFTER INDEXING - Show improved performance
-- Query 1 (by default)
EXPLAIN SELECT 
    s.student_name,
    sub.subject_name,
    r.marks,
    r.grade
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE r.marks BETWEEN 70 AND 85
ORDER BY r.marks DESC;

-- Query 1 (Using FORCE INDEX to compare performance)
EXPLAIN SELECT 
    s.student_name,
    sub.subject_name,
    r.marks,
    r.grade
FROM Result r FORCE INDEX (idx_marks_btree)
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE r.marks BETWEEN 70 AND 85
ORDER BY r.marks DESC;

-- Query 2
SELECT 
    student_name,
    class_name,
    gender
FROM Student
WHERE MATCH(student_name) AGAINST('Lim');

EXPLAIN SELECT 
    student_name,
    class_name,
    gender
FROM Student
WHERE MATCH(student_name) AGAINST('Lim');

-- Before: Full table scans by examining all 44 students
-- After: Index-based searches, examine only relevant records

-- Query 3
EXPLAIN SELECT 
    s.student_name,
    s.class_name,
    sub.subject_name,
    AVG(r.marks) AS avg_marks
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Exam e ON r.exam_id = e.exam_id
JOIN Subject sub ON e.subject_id = sub.subject_id
WHERE r.marks > 50
GROUP BY s.student_id, sub.subject_id
HAVING AVG(r.marks) > 70
ORDER BY avg_marks DESC;

