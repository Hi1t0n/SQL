use city_telephone_network_db;
select phone_numbers.phoneNumberId,phone_numbers.phoneNumber,tariffs.name AS tariffs
from phone_numbers
inner join tariffs ON phone_numbers.tariffId=tariffs.tariffId
ORDER BY phoneNumberId;