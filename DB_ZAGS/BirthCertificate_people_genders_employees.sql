use zags;
SELECT bc.BirthCertificateID, p.Name As 'Имя заявителя', p.Surname AS 'Фамилия заявителя', p.Patronymic AS 'Отчество заявителя',
 f.Name AS 'Имя отца', f.Surname AS 'Фамилия отца', f.Patronymic AS 'Отцество отца', m.Name AS 'Имя матери', m.Surname AS 'Фамилия матери', m.Patronymic AS 'Отчество матери',
 bc.DateOfBirth as 'Дата рождения', bc.PlaceOfBirth as 'Место рождения', bc.`Child'sFirstName` as 'Имя ребенка', bc.`Child'sSurname` as 'Фамилия ребенка', bc.`Child'sPatronymic` as 'Отчество ребенка',
 g.GenderName as 'Пол', e.Name as 'Имя сотрудника', e.Surname as 'Фамилия сотрудника', e.Patronymic as 'Отчество сотрудника', pos.PositionName as 'Должность'
FROM `birth certificates` bc
INNER JOIN people p ON p.PeopleID = bc.PersonID
INNER JOIN people f ON f.PeopleID = bc.FatherID
INNER JOIN people m ON m.PeopleID = bc.MotherID
INNER JOIN genders g ON g.GendersID = bc.GenderID
INNER JOIN employees e ON e.EmployeeID = bc.EmployeeID
INNER JOIN positions pos ON e.PositionID = pos.PositionID