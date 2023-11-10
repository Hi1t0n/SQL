use city_telephone_network_db;
SELECT calls.callId, calls.dateTime, calls.duration_in_seconds, sender.first_name, sender.last_name, recipient.first_name, recipient.last_name 
FROM calls 
INNER JOIN users AS sender ON sender.userID = calls.senderId 
INNER JOIN users AS recipient ON recipient.userID = calls.recipientId 