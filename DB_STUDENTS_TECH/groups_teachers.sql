use students;
select g.GroupID,g.GroupName,t.FirstName,t.LastName,t.Patronymic
from `groups` g
inner join teachers t ON t.TeacherID = g.TeacherID;