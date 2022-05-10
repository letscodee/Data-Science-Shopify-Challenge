-- Question 1: How many orders were shipped by Speedy Express in total?
-- Answer: 54 
-- Steps: Join Orders table with shippers table and count the number of Orders where shipper name = Speedy Express

SELECT
   count(distinct OrderID) As Orders_Shipped_by_Speedy_Express 
FROM
   Orders o 
   join
      Shippers s using (ShipperID) 
where
   lower(ShipperName) like 'speedy%express'


-- Question 2: What is the last name of the employee with the most orders?
-- Answer: Peacock
-- Steps: Join Orders table with employees table and count the number of Orders grouping the last name and order by Number of Orders descending and limit 1 to see the highest orders

SELECT
   LastName,
   Count(DISTINCT OrderID) as NumberOfOrders 
FROM
   Orders o
   LEFT JOIN
      Employees e USING (EmployeeID) 
GROUP BY
   LastName 
ORDER BY
   NumberOfOrders DESC LIMIT 1;


-- Question 3: What product was ordered the most by customers in Germany?
-- Answer: Boston Crab Meat
-- Steps: Join Customers table with Orders table using the customer ID and then join with OrderDetails to get the OrderID and then finally with products to find the quantity where country is germany and group it by product name to find the product ordered most.

SELECT
   ProductName,
   sum(Quantity) as TotalOrders 
from
   Customers c 
   join
      Orders o using (CustomerID) 
   join
      OrderDetails d using (OrderID) 
   join
      Products p using (ProductID) 
where
   lower(country) = 'germany' 
GROUP BY
   ProductName
ORDER BY
   TotalOrders DESC LIMIT 1;


