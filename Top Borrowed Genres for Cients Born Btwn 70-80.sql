	/* return top borrowed genres for client born in years 1970-1980 */
    SELECT genre, count(genre) AS timesborrowed
	FROM book_table
	INNER JOIN (
		/* return bookid for all books borrowed between 1970-1980 */
		SELECT bookid
        		FROM borrower_table
        		WHERE clientid IN(
			SELECT clientid
			FROM client_table
			WHERE clientdob BETWEEN 1970 AND 1980))
	AS borroweddob70to80
	ON book_table.bookid = borroweddob70to80.bookid
	GROUP BY genre
	ORDER BY timesborrowed DESC LIMIT 5;