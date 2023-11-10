use zags;
select dc.DeathCertificateID,p.Name, p.Surname, p.Patronymic,p.DateOfBirth,
dc.DateOfDeath,dc.PlaceOfDeath,dc.CauseOfDeath, e.Name,e.Surname,e.Patronymic, pos.PositionName
FROM `death certificates` dc
INNER JOIN people p ON p.PeopleID = dc.PersonID
INNER JOIN employees e ON e.EmployeeID = dc.EmployeeID
INNER JOIN positions pos ON pos.PositionID = e.PositionID;
