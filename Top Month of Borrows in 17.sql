	/*return average number of borrows by age*/
	SELECT CAST(YEAR(CURDATE()) - clientdob AS UNSIGNED) AS age, AVG(numbooksborrowed) AS avgbooksborrowed
	FROM client_table
	INNER JOIN( 
		/*return client id and times they borrowed a book*/
		SELECT booksborrowed.clientid, booksborrowed.bookid, count(booksborrowed.clientid) AS numbooksborrowed
		FROM client_table
		INNER JOIN (
			SELECT clientid, bookid
			FROM borrower_table)
		AS booksborrowed
		ON client_table.clientid = booksborrowed.clientid
		GROUP BY booksborrowed.clientid)
	AS avgborrowsperoccupation
	ON client_table.clientid = avgborrowsperoccupation.clientid
	GROUP BY age;