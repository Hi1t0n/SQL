SELECT e.EmployeeID,e.Name,e.Surname,e.Patronymic,g.GenderName,e.DateOfBirth,pos.PositionName 
from employees e
inner join genders g ON g.GendersID = e.GenderID
inner join positions pos ON pos.PositionID = e.PositionID 
ORDER BY e.EmployeeID;