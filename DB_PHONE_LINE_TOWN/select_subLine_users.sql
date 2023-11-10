use city_telephone_network_db;
select subscriber_line.lineId,subscriber_line.lineNumber,users.first_name,users.last_name
from subscriber_line
inner join users on subscriber_line.userId = users.userID;