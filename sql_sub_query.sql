use sakila;

#########Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.#########
select count(inventory_id) from inventory
where film_id in (select film_id from film
				where title ="Hunchback Impossible");


#########List all films whose length is longer than the average length of all the films in the Sakila database#############

select film_id, title,length from film 
where length >(select avg(length) from film f);

######### Use a subquery to display all actors who appear in the film "Alone Trip".############
select first_name, last_name from actor
where actor_id in (
select actor_id from film_actor
where film_id in ( select film_id from film
				 where title = "Alone Trip"));

######### Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies categorized as family films###

select * from film;
select film_id,title from film
where film_id in (select film_id from film_category
where category_id in (select category_id from category
	where name in ("family","children","comedy","games","sports")));
    

####### Retrieve the name and email of customers from Canada######
select  customer_id,first_name,last_name , email, address_id from customer
where address_id in (select address_id from address
						where city_id in (select city_id from city
                        where country_id in (select country_id from country
                        where country = "Canada")));
                    
		
# using join
select  cu.customer_id ,cu.first_name,cu.last_name , cu.email, cu.address_id from customer cu
join address ad using (address_id)
join city ci using (city_id)
join country using (country_id)
where country = "Canada"
group by cu.customer_id;


######
select * from film_actor;
select distinct (film_id) from film_actor
group by actor_id;

