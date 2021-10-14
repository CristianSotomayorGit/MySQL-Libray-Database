	/* return most borrowed book title between 2015-2017*/
    SELECT BookTitle 
	FROM book_table
	INNER JOIN(
		/* return top book in table */
		SELECT bookid, YEAR(borrowdate) AS yearborrowed, COUNT(bookid) as 				timesborrowed
		FROM borrower_table
		WHERE YEAR(BorrowDate) BETWEEN 2015 AND 2017
		GROUP BY bookid
		ORDER BY timesborrowed DESC LIMIT 1)
	AS topbookborrowed
	ON book_table.bookid = topbookborrowed.bookid;