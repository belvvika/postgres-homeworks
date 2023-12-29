-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
select customers.company_name, employees.last_name from customers join employees on customers.city = employees.city join shippers on customers.company_name = shippers.company_name where customers.city = 'London' and shippers.company_name = 'United Package'

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
select product_name, units_in_stock, suppliers.contact_name, suppliers.phone from products join suppliers using (supplier_id) inner join categories using (category_id) where units_in_stock < 25 and discontinued = 0 and (category_name = 'Condiments' or category_name = 'Dairy Products') order by units_in_stock

-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
select customers.company_name from customers join orders on customers.customer_id = orders.customer_id join order_details on order_details.order_id = orders.order_id where order_details.quantity = 0

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
select product_name from products where product_id = any (select product_id from order_details where quantity = 10) group by product_id