USE `mydb` ;
INSERT INTO admin(UserName,Password,Name,Surname,PhoneNumber,Email,Status) VALUES
('admin6','200004', 'Ali', 'Veli', '(532)444-22-22','ali.veli@mail.com', 1);
INSERT INTO admin(UserName,Password,Name,Surname,PhoneNumber,Email,Status) VALUES
('admin7','200005', 'Cem', 'Cem', '(532)444-22-22','cem.cem@mail.com', 4);
INSERT INTO admin(UserName,Password,Name,Surname,PhoneNumber,Email,Status) VALUES
('admin8','200006', 'Ayşe', 'Avcı', '(532)444-22-22','ayse.avci@mail.com', 4);
select* from grades;

set sql_safe_updates = 0;
update grades set MidtermGrade = MidtermGrade + 1 where MidtermGrade<100;
update admin set Status = Status + 2;
update teacher set Lesson_idLesson = Lesson_idLesson + 1;

alter table grades add average double;
alter table grades modify column average integer;
alter table grades drop average;

select * from department inner join teacher on Department.Faculty_idFaculty=teacher.Faculty_idFaculty;
select * from teacher natural join lesson;
(select * from grades left join teacher on teacher.Lesson_idLesson=grades.Lesson_idLesson)union(select * from grades right join teacher on teacher.Lesson_idLesson=grades.Lesson_idLesson);

create unique index idx2 on mydb.admin(Password,Name) ;
create index idx3 on mydb.faculty(FacultyName); 
select* from faculty;
create index idx6 on mydb.department(Faculty_idFaculty asc); 
select* from admin;
ALTER TABLE department DROP INDEX idx6;
create unique index idx7 on mydb.lesson(Password,Name);
create index idx8 on mydb.teacher(status asc); 
create index idx8 on mydb.student(birthdate);
create index idx9 on mydb.grades(FinalGrade desc); 
create index idx10 on mydb.student_has_grades(Student_idStudent); 




CREATE TABLE IF NOT EXISTS `mydb`.`Operation` (
  `İdOperation` INT NOT NULL AUTO_INCREMENT,
	`Object` VARCHAR(45) NOT NULL,
  `OpName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`İdOperation`)
)
ENGINE = InnoDB;
select*from Operation;
select*from admin;

DELIMITER $$
CREATE TRIGGER trig1 before INSERT ON admin FOR EACH ROW
BEGIN
INSERT INTO Operation(Object,OpName) VALUES (new.userName,' inserted');
END
$$DELIMITER ;
INSERT INTO admin(UserName,Password,Name,Surname,PhoneNumber,Email,Status) VALUES('admin9','200007', 'Ali', 'Öztürk', '(532)444-22-22','ali.zoturk@mail.com', 9);

DELIMITER $$
CREATE TRIGGER trig2 before delete on admin FOR EACH ROW
 BEGIN
INSERT INTO Operation(Object,OpName) VALUES (old.userName,' deleted');
END$$
DELIMITER ;

delete from admin where UserName='admin9';

SHOW TRIGGERS;

drop TRIGGER trig1;

select* from admin;




DELIMITER //
CREATE PROCEDURE Assertion1(out var integer)
BEGIN
IF ((SELECT COUNT(*) FROM grades)>(SELECT COUNT(*) FROM admin)) THEN
  SET var = 1;
  ELSE
  SET var = 0;
END IF;
END//
DELIMITER ;

call Assertion2(@result);
select @result;

DELIMITER //
CREATE PROCEDURE Assertion2(out var VARCHAR(45))
BEGIN
IF ((SELECT COUNT(*) FROM faculty)<(SELECT COUNT(*) FROM department)) THEN
  SET var = 'True';
ELSE
  SET var = 'False';
END IF;
END//
DELIMITER ;


