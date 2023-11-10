select mc.MarriageCertificateID, p1.Name as 'имя 1-го супруга',p1.Surname as 'фамилия 1-го супруга',p1.Patronymic as 'отчество 1-го супруга',p1.DateOfBirth as 'дата рождения 1-го супруга',
g1.GenderName as 'пол 1-го супруга',
p2.Name as 'имя 2-го супруга',p2.Surname as 'фамилия 2-го супруга',p2.Patronymic as 'отчество 2-го супруга',p2.DateOfBirth as 'дата рождения 2-го супруга',
g2.GenderName as 'пол 2-го супруга' ,mc.DateOfMarriage as 'дата свадьбы',mc.PlaceOfMarriage as 'место свадьбы',e.Name as 'имя сотрудника',e.Surname as 'фамилия сотрудника',
e.Patronymic as 'отчество сотрудника',pos.PositionName as 'должность'
from `marriage certificates` mc
inner join people p1 on p1.PeopleID = mc.Person1ID
inner join people p2 on p2.PeopleID = mc.Person2ID
inner join genders g1 on g1.GendersID = p1.GenderID
inner join genders g2 on g2.GendersID = p2.GenderID
inner join employees e on e.EmployeeID = mc.EmployeeID
inner join positions pos on pos.PositionID = e.PositionID;
