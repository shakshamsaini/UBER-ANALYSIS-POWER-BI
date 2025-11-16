
-- Uber Ride Analysis SQL Script
-- Author: Shaksham Saini

-- 1. View total rides per customer
SELECT customer_id, COUNT(*) AS total_rides
FROM uber_rides
GROUP BY customer_id
ORDER BY total_rides DESC;

-- 2. Average fare amount by pickup location
SELECT pickup_location, AVG(fare_amount) AS avg_fare
FROM uber_rides
GROUP BY pickup_location
ORDER BY avg_fare DESC;

-- 3. Fetch high-value rides above ₹500
SELECT *
FROM uber_rides
WHERE fare_amount > 500
ORDER BY fare_amount DESC;

-- 4. Join Uber ride data with customer details
SELECT r.ride_id, r.customer_id, c.customer_name, r.fare_amount, r.pickup_location
FROM uber_rides r
JOIN customers c
  ON r.customer_id = c.customer_id;

-- 5. Find peak hour ride count
SELECT EXTRACT(HOUR FROM ride_timestamp) AS ride_hour,
       COUNT(*) AS total_rides
FROM uber_rides
GROUP BY EXTRACT(HOUR FROM ride_timestamp)
ORDER BY total_rides DESC;

-- 6. Total revenue generated per day
SELECT DATE(ride_timestamp) AS ride_date,
       SUM(fare_amount) AS daily_revenue
FROM uber_rides
GROUP BY DATE(ride_timestamp)
ORDER BY daily_revenue DESC;

-- 7. Identify most frequently used pickup locations
SELECT pickup_location, COUNT(*) AS ride_count
FROM uber_rides
GROUP BY pickup_location
ORDER BY ride_count DESC;

-- 8. Calculate average trip distance per customer
SELECT customer_id, AVG(trip_distance) AS avg_distance
FROM uber_rides
GROUP BY customer_id;

