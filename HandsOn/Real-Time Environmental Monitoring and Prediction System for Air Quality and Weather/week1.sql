create database project1

use project1

--Week1

--Task 1.Design Schema: Create tables to store sensor data,
--air quality readings, weather conditions, and pollution levels.

-- 1.1 Store sensor data
CREATE TABLE sensor_dim (
    sensor_id INT PRIMARY KEY,                -- Unique identifier for each sensor
    sensor_location VARCHAR(255) NOT NULL,    -- Location where the sensor is placed
    sensor_type VARCHAR(50) NOT NULL,         -- Type of sensor (e.g., air quality, weather)
    installation_date DATE,                   -- Date when the sensor was installed
    status VARCHAR(20) CHECK (status IN ('active', 'inactive', 'maintenance')) DEFAULT 'active' -- Status of the sensor
);

-- 1.2 Store air quality readings
CREATE TABLE air_quality_fact (
    record_id INT PRIMARY KEY,                -- Unique identifier for each record
    sensor_id INT,                            -- Foreign key referencing sensor_dim
    pm25 DECIMAL(5, 2) CHECK (pm25 >= 0),     -- PM2.5 in µg/m³ (micrograms per cubic meter)
    pm10 DECIMAL(5, 2) CHECK (pm10 >= 0),     -- PM10 in µg/m³
    co2 DECIMAL(6, 2) CHECK (co2 >= 0),       -- CO2 in ppm (parts per million)
    no2 DECIMAL(6, 2) CHECK (no2 >= 0),       -- NO2 in ppm (added for nitrogen dioxide levels)
    record_time TIMESTAMP NOT NULL,           -- Time when the reading was recorded
    FOREIGN KEY (sensor_id) REFERENCES sensor_dim(sensor_id) -- Ensuring referential integrity
);

-- 1.3 Store weather conditions
CREATE TABLE weather_fact (
    record_id INT PRIMARY KEY,                -- Unique identifier for each record
    sensor_id INT,                            -- Foreign key referencing sensor_dim
    temperature DECIMAL(4, 2) CHECK (temperature BETWEEN -50 AND 60), -- Temperature in Celsius
    humidity DECIMAL(4, 2) CHECK (humidity BETWEEN 0 AND 100),        -- Humidity as a percentage
    wind_speed DECIMAL(4, 2) CHECK (wind_speed >= 0),                 -- Wind speed in m/s
    precipitation DECIMAL(4, 2) CHECK (precipitation >= 0) DEFAULT 0, -- Precipitation in mm (added for rainfall)
    record_time TIMESTAMP NOT NULL,           -- Time when the reading was recorded
    FOREIGN KEY (sensor_id) REFERENCES sensor_dim(sensor_id) -- Ensuring referential integrity
);

-- 1.4 Store pollution levels (additional metrics beyond air quality)
CREATE TABLE pollution_fact (
    record_id INT PRIMARY KEY,                -- Unique identifier for each record
    sensor_id INT,                            -- Foreign key referencing sensor_dim
    so2 DECIMAL(6, 2) CHECK (so2 >= 0),       -- SO2 in ppm (Sulfur dioxide)
    o3 DECIMAL(6, 2) CHECK (o3 >= 0),         -- Ozone in ppm
    vocs DECIMAL(6, 2) CHECK (vocs >= 0),     -- Volatile Organic Compounds in ppm
    record_time TIMESTAMP NOT NULL,           -- Time when the reading was recorded
    FOREIGN KEY (sensor_id) REFERENCES sensor_dim(sensor_id) -- Ensuring referential integrity
);

--Task 2.Querying Data: Write SQL queries to monitor air quality, track pollution levels over time,
--and calculate average temperature and humidity.

-- 2.1 Monitor air quality
SELECT sensor_location, AVG(pm25) AS avg_pm25
FROM air_quality_fact aqf
JOIN sensor_dim sd ON aqf.sensor_id = sd.sensor_id
GROUP BY sensor_location
ORDER BY avg_pm25 DESC;

-- 2.2 Track pollution levels over time (example for CO2)
SELECT sensor_location, record_time, co2
FROM air_quality_fact aqf
JOIN sensor_dim sd ON aqf.sensor_id = sd.sensor_id
WHERE co2 > 400 -- Threshold for elevated CO2 levels
ORDER BY record_time;

-- 2.3 Calculate average temperature and humidity
SELECT sensor_location, AVG(temperature) AS avg_temp, AVG(humidity) AS avg_humidity
FROM weather_fact wf
JOIN sensor_dim sd ON wf.sensor_id = sd.sensor_id
GROUP BY sensor_location
ORDER BY avg_temp DESC, avg_humidity DESC;
