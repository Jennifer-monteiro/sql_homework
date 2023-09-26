-- 1. List all customers who live in Texas (use JOINs)

SELECT first_name, last_name
FROM customer city
LEFT JOIN address address on city.address_id = address.address_id
WHERE DISTRICT = 'Texas'

-- Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Brian Hardison, Ian Still

--2. Get all payments above $6.99 with the Customer's FullName

SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';

--Answer: Run query

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name 
FROM customer
WHERE customer_id in (select customer_id
FROM payment
WHERE amount > 175.00);

-- Answer: MARY E DOUGLAS

--4. List all customers that live in Nepal (use the city table)
SELECT first_name
FROM (SELECT country_id, country
FROM country
WHERE country = 'Nepal') AS Country_Nepal
LEFT JOIN city ON Country_Nepal.country_id = city.country_id
LEFT JOIN address new ON city.city_id = new.city_id
LEFT JOIN customer client ON new.address_id = client.address_id;

--Answer: Kevin

--5. Which staff member had the most transactions?

SELECT staff.staff_id, first_name, last_name, COUNT(rental_id)
FROM staff
INNER JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id;

--ANSWER: Mike Hillyer with 8040 rentals 

--6. How many movies of each rating are there?
SELECT rating, COUNT(film_id) 
FROM film
GROUP BY rating;

-- ANSWER: NC-17: 209, G: 178, PG-13:223, PG 194, R: 196

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name
FROM customer
WHERE (select count(payment_id) from payment
WHERE payment.customer_id = customer.customer_id and payment.amount > 6.99) = 1;

-- Answer: Harold, Douglas, Alvin, Alfredo 

-- How Many free rentals did our stores give away?
SELECT count(amount) 
FROM rental rent
JOIN payment payment ON rent.rental_id = payment.rental_id
where amount = 0;

--Answer: No free rentals
