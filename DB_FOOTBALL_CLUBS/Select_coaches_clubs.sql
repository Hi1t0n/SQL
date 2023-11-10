use football_clubs;
SELECT coaches.CoachID, coaches.First_name, 
coaches.Last_name,coaches.Patronymic,
coaches.Birthdate, clubs.Club_name FROM coaches 
join clubs ON coaches.ClubID = clubs.ClubID; 
