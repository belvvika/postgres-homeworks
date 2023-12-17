-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы, доставленные в страны France, Germany, Spain (таблица orders, колонка ship_country)
select order_id from orders where ship_country in ('France', 'Germany', 'Spain')

-- 2. уникальные страны и города, куда отправлялись заказы, отсортировать по странам и городам (таблица orders, колонки ship_country, ship_city)
select ship_country, ship_city from orders order by ship_country, ship_city

-- 3. сколько дней в среднем уходит на доставку товара в Германию (таблица orders, колонки order_date, shipped_date, ship_country)
select avg(orders.shipped_date - orders.order_date) from orders where ship_country = 'Germany'

-- 4. минимальную и максимальную цену среди продуктов, не снятых с продажи (таблица products, колонки unit_price, discontinued не равно 1)
select max(products.unit_price) from products where discontinued != 1;
select min(products.unit_price) from products where discontinued != 1

-- 5. минимальную и максимальную цену среди продуктов, не снятых с продажи и которых имеется не меньше 20 (таблица products, колонки unit_price, units_in_stock, discontinued не равно 1)
select max(products.unit_price) from products where discontinued != 1 and units_in_stock >= 20;
select min(products.unit_price) from products where discontinued != 1 and units_in_stock >= 20