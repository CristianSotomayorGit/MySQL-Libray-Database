/*create view and display titles borrowd by at least 20% of people*/
	CREATE VIEW clientsthatborrowedperbook AS
		SELECT booktitle, percentageofclientsthatborrowed
    		FROM(
			/*return book titles and percentage of clients that borrowed*/
			SELECT booktitle, timesbookwasborrowed/80 AS percentageofclientsthatborrowed
			FROM(
				/*return book title, book id and number of times the title was borrowed */
				SELECT booktitle, allbooksborrowed.Bookid, count(allbooksborrowed.bookid) AS timesbookwasborrowed
				FROM book_table
				INNER JOIN(
					SELECT bookid, clientid
					FROM borrower_table) AS allbooksborrowed
				ON book_table.bookid = allbooksborrowed.bookid
				GROUP BY booktitle) AS finaltable)
	AS tableforview
	WHERE percentageofclientsthatborrowed>= 0.20;

	/*display all fields in view*/
	SELECT *
	FROM clientsthatborrowedperbook;
