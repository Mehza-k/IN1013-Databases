-- 1

SELECT T1.first_name, T1.surname, T2.bill_date, COUNT(T2.bill_no) 
FROM restStaff T1 INNER JOIN restBill T2 ON T1.staff_no = T2.waiter_no
GROUP BY T1.first_name, T1.surname, T2.bill_date
HAVING COUNT(T2.bill_no) > 1;

-- 2

SELECT T1.room_name, COUNT(T2.table_no) 
FROM restRoom_management T1 INNER JOIN restRest_table T2 ON T1.room_name = T2.room_name
WHERE T2.no_of_seats > 6
GROUP BY T1.room_name;

--3

SELECT T1.room_name, COUNT(T2.bill_no) 
FROM restRest_table T1 INNER JOIN restBill T2 ON T1.table_no = T2.table_no
GROUP BY T1.room_name;

-- 4

SELECT T1.first_name, T1.surname, SUM(T3.bill_total) 
FROM restStaff T1 INNER JOIN restStaff T2 ON T2.headwaiter = T1.staff_no
INNER JOIN restBill T3 ON T2.staff_no = T3.waiter_no
GROUP BY T1.first_name, T1.surname
ORDER BY SUM(T3.bill_total) DESC;

-- 5

SELECT T1.cust_name, AVG(T1.bill_total) 
FROM restBill T1
GROUP BY T1.cust_name
HAVING AVG(T1.bill_total) > 400.00;

-- 6

SELECT T1.first_name, T1.Surname, COUNT(T2.bill_no) 
FROM restStaff T1 INNER JOIN restBill T2 ON T1.staff_no = T2.waiter_no
GROUP BY T1.first_name, T1.Surname
HAVING COUNT(T2.bill_no) > 2;