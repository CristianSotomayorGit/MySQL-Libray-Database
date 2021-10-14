	/*return the average number of borrowed books by job title*/
	SELECT client_table.clientoccupation, 
		/*perform average calculation*/
		AVG(numbooksborrowed) AS avgbooksborrowed 
	FROM client_table
	INNER JOIN( 
		/*return number of books borrowed per client*/
		SELECT booksborrowed.clientid, booksborrowed.bookid, 							count(booksborrowed.clientid) AS numbooksborrowed
		FROM client_table
		INNER JOIN (
			SELECT clientid, bookid
			FROM borrower_table)
		AS booksborrowed
		ON client_table.clientid = booksborrowed.clientid
		GROUP BY booksborrowed.clientid)
	AS avgborrowsperoccupation
	ON client_table.clientid = avgborrowsperoccupation.clientid
	GROUP BY clientoccupation;
