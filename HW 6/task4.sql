-- 1 do again cose its worng
SELECT T1.cust_name FROM restBill T1 WHERE T1.bill_total > 450.00 AND T1.waiter_no = 
(SELECT DISTINCT T2.staff_no FROM restStaff T2 WHERE T2.headwaiter = 'Charles');

-- 2  2.A customer called Nerida has complained that a waiter was rude to her when 
--     she dined at the restaurant on the 11th January 2016. What is the name and
--     surname of the Headwaiter who will have to deal with the matter?

SELECT T1.first_name, T1.surname 
FROM restStaff T1 
WHERE T1.staff_no =
(SELECT T2.headwaiter FROM restStaff T2 WHERE T2.staff_no IN
(SELECT T3.waiter_no FROM restBill T3  WHERE T3.bill_date = '160111' AND cust_name LIKE "Nerida %"));

-- 3 What are the names of customers with the smallest bill?
SELECT T1.cust_name FROM restBill T1 WHERE T1.bill_total = 
(SELECT MIN(T2.bill_total) FROM restBill T2);

-- 4  List the names of any waiters who have not taken any bills.
SELECT T1.first_name, T1.surname FROM restStaff T1 WHERE T1.headwaiter IS NOT NULL 
AND T1.staff_no NOT IN (SELECT T2.waiter_no FROM restBill T2);

-- 5 5.	Which customers had the largest single bill? List the customer name, 
--the name and surname of headwaiters, and the room name where they were served on that occasion.
?