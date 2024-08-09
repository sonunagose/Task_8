select * from sales

select * from customer

select * from product 

select c.customer_name,s.order_line,s.sales from sales as s
inner join customer as c
on c.customer_id = s.customer_id

---view---
	
create view sales_customer_product_details as
select s.product_id,p.product_name,s.customer_id,c.customer_name,
sum(sales)as "sum_of_sales" , sum(s.profit)as "sum_of_profit",sum(s.quantity)as"sum_of_quantity",sum(s.discount)as "sum_of_discount"
from sales as s
inner join customer as c
on s.customer_id=c.customer_id
inner join product as p
on s.product_id=p.product_id
group by s.product_id,p.product_name,s.customer_id,c.customer_name
order by sum(sales)

select * from sales_customer_product_details	

--Subquery query--

select order_line,sales, 
(select customer_name from customer as c where s.customer_id=c.customer_id)from sales as s
	
--having query--

select p.category, p.product_name, sum(s.quantity) from sales as s
inner join product as p
on s.product_id = p.product_id
group by p.category,p.product_name
having sum(quantity) > 1
	
---1.Insert---

select * from sales_customer_product_details

insert into sales_customer_product_details ( product_id, product_name, customer_id,customer_name, sum_of_sales,
sum_of_profit, sum_of_quantity, sum_of_discount)
values('OFF-AP-10002907','Avery Non-Stick Binders','ZC-21910','Mahesh',3.223,0.565,3,0.7)	

---2.UPDATE---

update sales_customer_product_details
set product_name = 'KEYBOARD'
where product_id = 'OFF-AP-10002907'

---3.ALTER---
	
ALTER view sales_customer_product_details as
ADD column Total_sale  double precision 

---4.delete---

select * from customer
	
delete from sales_customer_product_details
where customer_id = GH-14485 

-------------------------------------------------
ERROR:  Views containing GROUP BY are not automatically updatable.cannot insert into view "sales_customer_product_details" 

ERROR:  cannot insert into view "sales_customer_product_details"
SQL state: 55000
Detail: Views containing GROUP BY are not automatically updatable.
Hint: To enable inserting into the view, provide an INSTEAD OF INSERT trigger or an unconditional ON INSERT DO INSTEAD rule.

 ERROR:  Views containing GROUP BY are not automatically updatable.cannot update view "sales_customer_product_details" 

ERROR:  cannot update view "sales_customer_product_details"
SQL state: 55000
Detail: Views containing GROUP BY are not automatically updatable.
Hint: To enable updating the view, provide an INSTEAD OF UPDATE trigger or an unconditional ON UPDATE DO INSTEAD rule.