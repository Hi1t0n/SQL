use football_clubs;
SELECT players.PlayerID, players.First_name,players.Last_name,players.Birthdaydate,players.Number, clubs.Club_name,positions.Position_name
FROM players
INNER JOIN clubs ON players.ClubID = clubs.ClubID
INNER JOIN positions ON players.PositionID = positions.PositionID;