	SELECT authorfirstname, authorlastname
	FROM author_table
	WHERE authorid IN(
		SELECT bookauthor
		FROM book_table
		INNER JOIN(
			SELECT bookid, YEAR(borrowdate) AS yearborrowed, COUNT(bookid) as 				timesborrowed
			FROM borrower_table
			WHERE YEAR(BorrowDate) = 2017 /* return only values matching 2017 */
			GROUP BY bookid
			ORDER BY timesborrowed DESC LIMIT 5) /* limit to top 5 values */
		AS top5booksborrowed
		ON book_table.bookid = top5booksborrowed.bookid);