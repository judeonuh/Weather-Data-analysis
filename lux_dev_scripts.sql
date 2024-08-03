create database if not exists luxdev_project_DBs;
use luxdev_project_DBs;

select count(*) from weather_data; -- 8784 records
select * from weather_data;

-- Find all records where the weather was exactly clear.
select * from weather_data
where Weather = 'Clear';

-- Find the number of times the wind speed was exactly 4 km/hr.
select count(*) as 'Wind Speed = 4km/hr (count)'
from weather_data
where Wind_Speed_km_h = 4;

-- Check if there are any NULL values present in the dataset.
select * from weather_data
where 
Date_Time is null 
or Temp_C is null 
or Dew_Point_Temp_C is null 
or Rel_Humidity is null 
or Wind_Speed_km_h is null 
or Visibility_km is null 
or Press_kPa is null 
or Weather is null;

-- Rename the column "Weather" to "Weather_Condition."
alter table weather_data
rename column Weather to Weather_Condition;
select * from weather_data;

-- What is the mean visibility of the dataset?
select round(avg(Visibility_km),2) as mean_visibility_km
from weather_data;

-- Find the number of records where the wind speed is greater than 24 km/hr and visibility is equal to 25 km.
select count(*) from weather_data
where Wind_Speed_km_h > 24 and Visibility_km = 25;

-- What is the mean value of each column for each weather condition?
select 
round(avg(Temp_C), 2) as mean_temp,
round(avg(Dew_Point_Temp_C),2) as mean_dew_point,
round(avg(Rel_Humidity),2) as mean_rel_humidity,
round(avg(Wind_Speed_km_h),2) as mean_wind_speed,
round(avg(Visibility_km),2) as mean_visibility,
round(avg(Press_kPa),2) as mean_pressure,
Weather_Condition
from weather_data
group by Weather_Condition
order by Weather_Condition;

-- Find all instances where the weather is clear and the relative humidity is greater than 50, or visibility is above 40.
select * from weather_data
where weather_condition = 'Clear' and Rel_Humidity > 50 or Visibility_km > 40;

-- Find the number of weather conditions that include snow.
select count(*) from weather_data
where Weather_Condition like '%snow%';