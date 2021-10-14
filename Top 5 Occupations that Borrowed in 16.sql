	/* return top 5 occupations that borrowed the most in 2016 */
    SELECT clientoccupation, count(clientoccupation) as borrowsperoccupation
	FROM client_table
	INNER JOIN (
		/* return client id for books borrowed in 2016*/
		SELECT clientid
		FROM borrower_table
		WHERE YEAR(borrowdate) = 2016)
	AS occupationsborrowed
	ON client_table.clientid = occupationsborrowed.clientid
	GROUP BY clientoccupation
	ORDER BY borrowsperoccupation DESC LIMIT 5;