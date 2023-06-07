CREATE DATABASE School;
USE School;
CREATE TABLE GROUPS(
ID INT PRIMARY KEY IDENTITY,
[No] INT
)

CREATE TABLE Students(
ID INT PRIMARY KEY IDENTITY,
Fullname nvarchar(30),
Point DECIMAL,
GroupID INT FOREIGN KEY REFERENCES GROUPS(ID)
)

CREATE TABLE EXAMS(
ExamID INT PRIMARY KEY IDENTITY,
SubjectName NVARCHAR(30),
StartDate DATETIME,
EndDate DATETIME
)

CREATE TABLE StudentExams(
StudentID INT FOREIGN KEY REFERENCES Students(ID),
ExamID INT FOREIGN KEY REFERENCES EXAMS(ExamID),
ResultPoint DECIMAL
)

INSERT INTO GROUPS
VALUES (219),(136),(321),(876),(568),(654),(234),(874);

INSERT INTO Students
VALUES ('Ilkin Danziyev', 90,1),('Nicat Soltanov',95,1),('Hacar Huseynova',0,2),('Isa Sadigov',96,2),('Ilkin Allahverdiyev',87,3),('Huseyn Cafarov',78,4);

INSERT INTO Exams
VALUES('Database','2020-02-20','2020-02-24'),('Programming','2020-12-14','2020-12-16'),('Operating Systems','2020-09-21','2020-09-29'),('Computer Network','2021-02-13','2021-03-01');

INSERT INTO StudentExams
VALUES
    (1, 1, 85.5),
	(1, 2, 63.0),
	(1, 4, 90.0),
    (2, 1, 92.0),
	(2, 2, 54.0),
	(2, 3, 67.0),
	(2, 4, 76.0),
    (3, 1, 78.5),
	(3, 4, 34.0),
    (4, 1, 90.0),
    (5, 1, 88.5),
	(6, 2, 81.0),
    (7, 2, 95.5),
    (8, 2, 87.0),
    (9, 3, 79.5),
    (10, 3, 92.5),
    (11, 3, 88.0),
    (12, 3, 76.0),
    (13, 4, 98.0),
    (14, 4, 85.5),
    (15, 4, 81.5),
	(16, 4, 90.5),
	(16, 3, 54.7),
    (17, 2, 86.0),
    (18, 2, 77.5),
	(18, 4, 67.0);
	


	SELECT St.ID ,Fullname,Point,GroupID,[No]  From Students as St
	Left Join GROUPS as GR on GR.ID=St.GroupID;

	SELECT St.ID, St.Fullname,St.Point,St.GroupID,Count(Ex.ExamID) From Students AS St
	Left Join StudentExams AS Ex ON St.ID=Ex.StudentID GROUP BY St.ID, St.Fullname, St.Point, St.GroupID;
	
	Select Ex.ExamID, Ex.SubjectName,Ex.StartDate,Ex.EndDate,StEx.ResultPoint from  Exams as Ex
	Left JOIN StudentExams AS StEx ON StEx.ExamID=Ex.ExamID where StEx.ResultPoint is null   GROUP BY StEx.ResultPoint , Ex.ExamID, Ex.SubjectName,Ex.StartDate,Ex.EndDate
	
	Select Ex.ExamID, Ex.SubjectName,Ex.StartDate,Ex.EndDate,Count(StEx.ResultPoint) as'SudentCount' from  Exams as Ex
	Left JOIN StudentExams AS StEx ON StEx.ExamID=Ex.ExamID where Ex.StartDate=Convert(date, DATEADD(day, -1, GETDATE()))  GROUP BY Ex.ExamID, Ex.SubjectName,Ex.StartDate,Ex.EndDate
	
	SELECT Ex.ExamID,Ex.StudentID,Ex.ResultPoint,St.Fullname,GR.No From Students AS St
	Right Join StudentExams AS Ex ON St.ID=Ex.StudentID
	Right join GROUPS as GR ON St.GroupID=GR.ID
	GROUP BY GR.No, Ex.ExamID,Ex.StudentID, St.ID, St.Fullname, St.Point, St.GroupID,Ex.ResultPoint;
	

	SELECT St.ID,St.Fullname,St.Point,St.GroupID,AVG(StEx.ResultPoint)'Average' FROM Students AS St
	LEFT JOIN StudentExams AS StEx 
	ON St.ID=StEx.StudentID GROUP BY St.ID,St.Fullname,St.Point,St.GroupID;


	
