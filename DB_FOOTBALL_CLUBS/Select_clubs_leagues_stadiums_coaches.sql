use football_clubs;
SELECT clubs.ClubID,clubs.Club_name,clubs.Town,clubs.Year_of_foundation,leagues.League_name, stadiums.Stadium_name, coaches.First_name,coaches.Last_name,coaches.Patronymic
FROM clubs 
INNER JOIN leagues ON clubs.LeagueID = leagues.LeagueID
INNER JOIN stadiums ON clubs.StadiumID = stadiums.StadiumID
INNER JOIN coaches ON clubs.CoachID = coaches.CoachID;
