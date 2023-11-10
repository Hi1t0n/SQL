use students;
select sub.SubjectID,sub.SubjectName,t.FirstName,t.LastName,t.Patronymic
from subjects sub
inner join teachers t on t.TeacherID = sub.TeacherID;