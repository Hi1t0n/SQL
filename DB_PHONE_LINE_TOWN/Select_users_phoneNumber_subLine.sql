use city_telephone_network_db;
select users.userID,users.first_name,users.last_name,users.address,users.email,users.registration_data,phone_numbers.phoneNumber,subscriber_line.lineNumber
FROM users
INNER JOIN phone_numbers ON users.phoneNumberId = phone_numbers.phoneNumberId
INNER JOIN subscriber_line ON users.subscriberLineId = subscriber_line.lineId;
