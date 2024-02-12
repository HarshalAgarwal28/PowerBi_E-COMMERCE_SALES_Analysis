SELECT * from details , orders
SELECT * FROM orders 

/**SUM of amount**/

SELECT concat (round(SUM(amount)/1000,0),'K') from details 

SELECT concat(round(SUM(profit)/1000,0),'K') from details 

select sum (quantity) from details 

Select concat(round(SUM(amount / quantity)/1000,0),'K') from details 


Select month(orderdate), concat(round(sum(profit)/1000,1),'k') as total_profit

-- Profit-loss by Month 
Select to_char(orderdate,'Month') as order_month , concat(round(sum(profit)/1000,1),'k') as total_profit
from details
join orders on details.orderid = orders.orderid
group by order_month
order by total_profit desc



-- Quantity - category
SELECT category, SUM(quantity) as TotalQuantity,
    Round ((SUM(quantity) * 100.0) / (SELECT SUM(quantity) FROM details),0) as PercentageOfTotal
FROM details
GROUP BY category;

-- Top States
Select state, concat(round(sum(profit)/1000,1),'k') as total_profit
from details
join orders on details.orderid = orders.orderid
group by state
order by total_profit desc
limit 4


-- Top Customers 
Select customername, concat(round(sum(amount)/1000,1),'k') as total_sale
from details
join orders on details.orderid = orders.orderid
group by 1
order by total_sale desc
limit 4

-- Quantity - PaymentMode
Select paymentmode , (sum(quantity)*100)/ (select sum(quantity) from details) as PercentageOfTotal
from details 
group by paymentmode
order by PercentageOfTotal desc

--Profit by subcategory
select subcategory , concat(round(sum(profit)/1000,1),'K') sum_of_profit
from details 
group by subcategory
order by sum_of_profit desc 
limit 5



