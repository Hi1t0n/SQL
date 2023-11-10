use zags;
select p.PeopleID,p.Name,p.Surname,p.Patronymic,g.GenderName,p.DateOfBirth,p.PhoneNumber,p.Email 
from people p
inner join genders g on g.GendersID = p.GenderID;