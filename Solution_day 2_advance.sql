---SQL Project - Library Management System

SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM memners;
SELECT * FROM return_status;
SELECT * FROM issued_status;


---Task 13: 
Identify Members with Overdue Books
Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's_id, member's name, book title, issue date,

--issued_status == members == books == return_status
--- filter books which is return
-- overdue > 30

SELECT
      ist.issued_member_id,
	   m.member_name,
	   ist.issued_date,
	 --  rs.return_date,
	   CURRENT_DATE - ist.issued_date AS over_due
   FROM issued_status AS ist
   JOIN members AS m
      ON m.member_id = ist.issued_member_id
	JOIN 
	   books as bk
	  ON bk.isbn = ist.issued_book_isbn
	LEFT JOIN 
	  return_status as rs
	 ON rs.issued_id = ist.issued_id
	 WHERE rs.return_date IS NULL
	   AND 
	     (CURRENT_DATE - ist.issued_date) > 30
	ORDER BY 1
