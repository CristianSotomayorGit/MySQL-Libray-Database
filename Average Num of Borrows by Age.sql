/*return first and last names of authors that wrote books in more than one genre*/
	SELECT authorlastname, authorfirstname, authorgenretable.numofbooksindifgenres
	FROM author_table
I	INNER JOIN(
		/*return book author id and number of genres they wrote books in*/
		SELECT bookauthor, COUNT(genre) as numofbooksindifgenres
		FROM book_table
		GROUP BY bookauthor) 
	AS authorgenretable
	ON author_table.Authorid = authorgenretable.bookauthor		
	WHERE numofbooksindifgenres > 1 /*return only values matching more than 1 genre*/
	ORDER BY authorlastname;