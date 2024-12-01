-- 1
SELECT first_name, surname FROM restStaff T1 INNER JOIN restBill T2 
WHERE T1.staff_no = T2.waiter_no AND T2.cust_name = 'Tanya Singh';

-- 2
SELECT room_date FROM restRoom_management T1 INNER JOIN restStaff T2
WHERE T1.headwaiter = T2.staff_no AND T2.first_name = 'Charles' 
AND T1.room_name = 'Green' AND T1.room_date LIKE '1602%';

-- 3
SELECT T2.first_name, T2.surname FROM restStaff T1 INNER JOIN restStaff T2
ON T1.headwaiter = T2.headwaiter 
WHERE T1.first_name = 'Zoe' AND T1.surname = 'Ball';

-- 4
SELECT cust_name, bill_total, first_name 
FROM restStaff T1 INNER JOIN restBill T2
ON T1.staff_no = T2.waiter_no ORDER BY T2.bill_total DESC;

-- 5
SELECT DISTINCT T1.first_name, T1.surname
FROM restStaff T1 INNER JOIN restStaff T2 ON T1.headwaiter = T2.headwaiter
INNER JOIN restBill T3 ON T2.staff_no = T3.waiter_no
WHERE bill_no IN (00014, 00017);

-- 6 
SELECT T1.first_name AS 'Waiter First Name', T1.surname AS 'Waiter Surname',
T2.first_name AS 'Headwaiter First Name', T2.surname AS 'Headwaiter Surname'
FROM restStaff T1 INNER JOIN restStaff T2 
ON T1.headwaiter = T2.staff_no 
INNER JOIN restRoom_management T3 ON T2.staff_no = T3.headwaiter
WHERE T3.room_name = "Blue" AND T3.room_date = "160312";