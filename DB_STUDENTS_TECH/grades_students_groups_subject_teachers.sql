use students;
SELECT g.GradeID,
 s.FirstName as 'Имя студента',s.LastName as 'Фамилия студента',s.Patronymic as 'Отчество студента',s.studentRecordBookNum as 'Номер зачетки',
 gr.GroupName as 'Группа',
 sub.SubjectName as 'Предмет',
 g.Grade as 'Оценка',
 t.FirstName as 'Имя преподавателя',t.LastName as 'Фамилия преподавателя',t.Patronymic as 'Отчество преподавателя'
from grades g
inner join students s on s.StudentID = g.StudentID
inner join `groups` gr on gr.GroupID = s.GroupID
inner join subjects sub on sub.SubjectID = g.SubjectID
inner join teachers t on t.TeacherID = sub.TeacherID;