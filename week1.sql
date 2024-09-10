use Energy;

-- Create a table to store user information (User Profiles)
CREATE TABLE user_dim (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(255),
    location VARCHAR(255)
);

-- Create a table to store device information (Device Metadata)
CREATE TABLE device_dim (
    device_id INT PRIMARY KEY,
    device_type VARCHAR(255),
    location VARCHAR(255)
);

-- Create a table to store energy consumption readings
CREATE TABLE energy_fact (
    reading_id INT PRIMARY KEY,
    device_id INT,
    user_id INT,
    energy_consumed DECIMAL(10, 2), -- Energy consumed in kWh
    reading_time TIMESTAMP,
    FOREIGN KEY (device_id) REFERENCES device_dim(device_id),
    FOREIGN KEY (user_id) REFERENCES user_dim(user_id)
);

-- Calculate the average energy consumption for each user
SELECT user_id, AVG(energy_consumed) AS avg_consumption
FROM energy_fact
GROUP BY user_id
ORDER BY avg_consumption DESC;

-- Find peak energy usage periods where consumption exceeds 100 kWh
SELECT user_id, device_id, reading_time, energy_consumed
FROM energy_fact
WHERE energy_consumed > 100
ORDER BY reading_time ASC;

-- Summarize total energy consumption per device
SELECT device_id, SUM(energy_consumed) AS total_energy_consumed
FROM energy_fact
GROUP BY device_id
ORDER BY total_energy_consumed DESC;
