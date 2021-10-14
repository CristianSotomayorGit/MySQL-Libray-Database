	SELECT clientfirstname, clientlastname
	FROM client_table
	WHERE clientid IN (
		SELECT clientid 
		FROM borrower_table
		WHERE month(borrowdate) = 3); /*return only data matching march*/