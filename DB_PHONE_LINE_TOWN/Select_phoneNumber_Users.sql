use city_telephone_network_db;
select phone_numbers.phoneNumberId,phone_numbers.phoneNumber,users.first_name,users.last_name
from phone_numbers
inner join users ON phone_numbers.userId=users.userID;