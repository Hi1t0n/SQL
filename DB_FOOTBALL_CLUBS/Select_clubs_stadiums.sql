use football_clubs;
SELECT clubs.ClubID,clubs.Club_name,clubs.Town,clubs.Year_of_foundation,stadiums.Stadium_name
FROM clubs 
INNER JOIN stadiums ON clubs.StadiumID = stadiums.StadiumID;
