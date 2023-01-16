-- Week 5 - Monday Questions
-- 1. How many actors are there with the last name ‘Wahlberg’?
-- i'd probably look in.. actor... it is connected from film actor/ film
-- ===> actor_id, last_name 

select last_name 
from actor 
where last_name = 'Wahlberg';

-- but how many? 2 times...
select COUNT(*)
from actor 
where last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?

select COUNT(amount)
from payment 
where amount >= 3.99 AND amount <= 5.99;



-- 3. What film does the store have the most of? (search in inventory)
-- select *
-- from inventory;

SELECT COUNT(DISTINCT inventory_id), film_id
from inventory
group BY film_id
ORDER by COUNT(DISTINCT inventory_id) DESC, film_id ASC; --tho technically i dont NEEEED film_id asc... i think...

--add limit 1 to see the "top" result
LIMIT 1; 



-- 4. How many customers have the last name ‘William’?

SELECT *
from customer
where last_name = 'William'; -- No One
--check:
SELECT *
from customer
where last_name LIKE 'William%';




-- 5. What store employee (get the id) sold the most rentals?

select staff_id, COUNT(rental_id) --count the number of rentals for each staff
from rental
group by staff_id
order by COUNT(rental_id) DESC
limit 1; --to find the one top employee



-- 6. How many different district names are there?

SELECT COUNT(DISTINCT first_name)
from customer;




-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- SELECT * from film_actor;

SELECT film_id, COUNT(actor_id)
from film_actor
GROUP BY film_id
order by COUNT(actor_id) DESC
LIMIT 1;



-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- select * FROM customer WHERE store_id = 1;

select COUNT(*)
from customer
where last_name LIKE '%es' and store_id = 1;



-- 9. How many payment AMOUNTS 
-- (4.99, 5.99, etc.) 
-- had a number of rentals above 250 for customers 
-- with ids between 380 and 430? (use group by and having > 250)

select * FROM payment;

select amount, COUNT(rental_id) --counts HOW MANY!!!
from payment
where customer_id BETWEEN 380 AND 430
GROUP BY amount 
having COUNT(rental_id) > 250; --have a rental count above 250

-- select amount, COUNT(rental_id) from payment where customer_id BETWEEN 380 AND 430 group by amount;




-- 10. Within the film table, how many rating categories are there? 
-- And what rating has the most movies total?

-- select DISTINCT rating from film;
select COUNT(DISTINCT rating) FROM film;

-- select film_id, title, rating from film;

select rating, COUNT(*)
from film
group by rating
order by COUNT(*) DESC; 

--pg-13