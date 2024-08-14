-- write your queries here

-- Join the owners and vehicles tables, including all owners even if they don't have a vehicle
SELECT owners.id, owners.first_name, owners.last_name, vehicles.id, vehicles.make, vehicles.model, vehicles.year, vehicles.price, vehicles.owner_id
FROM owners
LEFT JOIN vehicles ON owners.id = vehicles.owner_id;

-- Count the number of cars for each owner, ordered by first_name in ascending order
SELECT owners.first_name, owners.last_name, COUNT(vehicles.id) AS count
FROM owners
LEFT JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.first_name, owners.last_name
ORDER BY owners.first_name ASC;

-- Count the number of cars for each owner and display the average price for each of the cars as integers
-- Only show owners with more than one vehicle and an average price greater than 10000, ordered by first_name descending
SELECT owners.first_name, owners.last_name, AVG(vehicles.price)::INTEGER AS average_price, COUNT(vehicles.id) AS count
FROM owners
LEFT JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.first_name, owners.last_name
HAVING COUNT(vehicles.id) > 1 AND AVG(vehicles.price) > 10000
ORDER BY owners.first_name DESC;
