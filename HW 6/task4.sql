-- 1

SELECT T1.cust_name FROM restBill T1 WHERE T1.bill_total > 450.00 AND T1.waiter_no = 
(SELECT DISTINCT T2.staff_no FROM restStaff T2 WHERE T2.headwaiter = 'Charles');

-- 2 

SELECT T1.first_name, T1.surname 
FROM restStaff T1 
WHERE T1.staff_no =
(SELECT T2.headwaiter FROM restStaff T2 WHERE T2.staff_no IN
(SELECT T3.waiter_no FROM restBill T3  WHERE T3.bill_date = '160111' AND cust_name LIKE "Nerida %"));

-- 3

SELECT T1.cust_name FROM restBill T1 WHERE T1.bill_total = 
(SELECT MIN(T2.bill_total) FROM restBill T2);

-- 4  

SELECT T1.first_name, T1.surname FROM restStaff T1 WHERE T1.headwaiter IS NOT NULL 
AND T1.staff_no NOT IN (SELECT T2.waiter_no FROM restBill T2);

-- 5 

?