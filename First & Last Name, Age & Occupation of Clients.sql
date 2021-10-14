	SELECT clientfirstname, clientlastname,
	CAST(YEAR(CURDATE()) - clientdob 
	AS UNSIGNED)  AS clientage /*perform calculation for client age clientoccupation */
	FROM client_table;