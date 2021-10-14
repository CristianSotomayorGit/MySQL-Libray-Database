	SELECT authornationality
	FROM author_table
	WHERE authorid IN(
		SELECT bookauthor
		FROM book_table
		INNER JOIN(
			SELECT bookid, YEAR(borrowdate) AS yearborrowed, COUNT(bookid) as 				timesborrowed
			FROM borrower_table
			WHERE YEAR(BorrowDate) BETWEEN 2015 AND 2017 /*return only values in range 2015 to 2017*/
			GROUP BY bookid
			ORDER BY timesborrowed LIMIT 5) /*limit to 5 bottom values*/
		AS bottom5booksborrowed
		ON book_table.bookid = bottom5booksborrowed.bookid
        	);
