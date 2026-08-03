USE sakila;

## SELECT Y WHERE

## Mostrar el nombre y apellido de los clientes
SELECT first_name, last_name
FROM customer;

## Mostrar las películas con duración mayor a 120 minutos
SELECT title, length
FROM film
WHERE length > 120;


## ORDER BY


## Ordenar los clientes por apellido
SELECT first_name, last_name
FROM customer
ORDER BY last_name;

## Mostrar las 5 películas más largas
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 5;


## PARTE 3 - INNER JOIN


## Mostrar el pago realizado por cada cliente
SELECT customer.first_name,
       customer.last_name,
       payment.amount,
       payment.payment_date
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id;

## Mostrar las películas alquiladas
SELECT film.title
FROM rental
JOIN inventory
ON rental.inventory_id = inventory.inventory_id
JOIN film
ON inventory.film_id = film.film_id;


## LEFT JOIN


## Clientes que no tienen pagos registrados
SELECT customer.first_name,
       customer.last_name
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.payment_id IS NULL;

## Películas que no tienen actores
SELECT film.title,
       film.length
FROM film
LEFT JOIN film_actor
ON film.film_id = film_actor.film_id
WHERE film_actor.actor_id IS NULL;


## INSERT, UPDATE Y DELETE


##Insertar un actor
INSERT INTO actor(first_name, last_name)
VALUES ('GENDERSON', 'GUTIERREZ');

##Actualizar el actor
UPDATE actor
SET first_name = 'STIVEN'
WHERE actor_id = 201;

##Eliminar el actor
DELETE FROM actor
WHERE actor_id = 201;


## CONSULTAS


##Top 5 clientes que más dinero pagaron
SELECT customer.first_name,
       customer.last_name,
       SUM(payment.amount) AS Total
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY Total DESC
LIMIT 5;

## Top 5 películas más alquiladas
SELECT film.title,
       COUNT(*) AS Total_Alquileres
FROM rental
JOIN inventory
ON rental.inventory_id = inventory.inventory_id
JOIN film
ON inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY Total_Alquileres DESC
LIMIT 5;