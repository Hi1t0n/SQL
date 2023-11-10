use football_clubs;
SELECT clubs.ClubID,clubs.Club_name,leagues.League_name
FROM clubs 
INNER JOIN leagues ON clubs.LeagueID = leagues.LeagueID
