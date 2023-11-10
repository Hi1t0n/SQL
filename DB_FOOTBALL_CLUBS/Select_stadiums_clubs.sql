USE football_clubs;
SELECT stadiums.StadiumID,stadiums.Stadium_name,stadiums.Capacity,clubs.Club_name 
FROM stadiums
INNER JOIN clubs ON stadiums.ClubID = clubs.ClubID;