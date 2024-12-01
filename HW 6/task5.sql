-- 1 1.	Which waiters have taken 2 or more bills on a single date? 
--List the waiter names and surnames, the dates and the number of bills they have taken.
SELECT T1.first_name, T1.surname, T2.bill_date, COUNT(T2.bill_no) 
FROM restStaff T1 INNER JOIN restBill T2 ON T1.staff_no = T2.waiter_no
GROUP BY T1.first_name, T1.surname, T2.bill_date
HAVING COUNT(T2.bill_no) > 1;

-- 2 2.	List the rooms with tables that can server more than 6 people and how many of such tables they have.
SELECT T1.room_name, COUNT(T2.table_no) 
FROM restRoom_management T1 INNER JOIN restRest_table T2 ON T1.room_name = T2.room_name
WHERE T2.no_of_seats > 6
GROUP BY T1.room_name;

--3 3.	List the names of the rooms and the total amount of bills in each room 
SELECT T1.room_name, COUNT(T2.bill_no) 
FROM restRest_table T1 INNER JOIN restBill T2 ON T1.table_no = T2.table_no
GROUP BY T1.room_name;

-- 4  4.	List the headwaiter’s name and surname and the total bill amount their waiters have taken. 
-- Order the list by total bill amount, largest first.
SELECT T1.first_name, T1.surname, SUM(T3.bill_total) 
FROM restStaff T1 INNER JOIN restStaff T2 ON T2.headwaiter = T1.staff_no
INNER JOIN restBill T3 ON T2.staff_no = T3.waiter_no
GROUP BY T1.first_name, T1.surname
ORDER BY SUM(T3.bill_total) DESC;


-- 5.	List any customers who have spent more than £400 on average.
SELECT T1.cust_name, AVG(T1.bill_total) 
FROM restBill T1
GROUP BY T1.cust_name
HAVING AVG(T1.bill_total) > 400.00;

-- 6.	Which waiters have taken 3 or more bills on a single date? List the waiter names, surnames, and the number of bills they have taken.
SELECT T1.first_name, T1.Surname, COUNT(T2.bill_no) 
FROM restStaff T1 INNER JOIN restBill T2 ON T1.staff_no = T2.waiter_no
GROUP BY T1.first_name, T1.Surname
HAVING COUNT(T2.bill_no) > 2;