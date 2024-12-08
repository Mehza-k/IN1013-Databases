
-- 1

CREATE VIEW samsBills AS
SELECT T1.first_name, T1.surname, T2.bill_date, T2.cust_name, T2.bill_total,
FROM restStaff T1 INNER JOIN restBill T2 
ON T1.staff_no = T2.waiter_no
WHERE T1.first_name = Sam and T1.surname = Pitt;

-- 2

SELECT * FROM samsBills
WHERE bill_total > 400.00;

-- 3

CREATE VIEW roomTotals AS
SELECT T1.room_name, SUM(T2.bill_total) AS total_sum
FROM restRest_table T1 INNER JOIN restBill T2 
ON T1.table_no = T2.table_no
GROUP BY T1.room_name;

-- 4

CREATE VIEW teamTotals AS
Select CONCAT(T1.first_name, ' ', T1.surname) AS headwaiter_name, SUM(T3.bill_total) AS total_sum
FROM restStaff T1 INNER JOIN restStaff T2 ON T1.staff_no = T2.headwaiter
INNER JOIN restBill T3 ON T2.staff_no = T3.waiter_no
GROUP BY T1.first_name, T1.surname;