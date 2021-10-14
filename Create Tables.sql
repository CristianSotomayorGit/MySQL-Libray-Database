CREATE TABLE Author_Table ( 
	Authorid INT UNIQUE NOT NULL,
	AuthorFirstName VARCHAR(25),
	AuthorLastName VARCHAR(25),
	AuthorNationality VARCHAR(25),
	PRIMARY KEY (authorid)
);
    
CREATE TABLE Book_table ( 
	Bookid INT UNIQUE NOT NULL,
	BookTitle VARCHAR(50),
	BookAuthor INT,
	Genre VARCHAR(15),
	
	PRIMARY KEY (Bookid),
   	FOREIGN KEY (BookAuthor)
	REFERENCES Author_table(Authorid)
);

CREATE TABLE Client_Table (
	Clientid INT UNIQUE NOT NULL,
	ClientFirstName VARCHAR(25),
	ClientLastName VARCHAR(25),
	ClientDoB YEAR,
	ClientOccupation VARCHAR(40),
	PRIMARY KEY (clientid)
);

CREATE TABLE Borrower_table (
	Borrowerid INT UNIQUE NOT NULL,
	Clientid INT NOT NULL,
	Bookid INT NOT NULL,
	BorrowDate DATE,
	
	PRIMARY KEY (borrowerid),
    
	FOREIGN KEY (Clientid)
	REFERENCES Client_table(Clientid), 
    
	FOREIGN KEY (Bookid) 
	REFERENCES Book_table(Bookid)
);