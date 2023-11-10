use students;
SELECT s.StudentID,s.FirstName,s.LastName,s.Patronymic,s.studentRecordBookNum,s.DateOfBirth,g.GroupName
from students s
inner join `groups` g on g.GroupID = s.GroupID;