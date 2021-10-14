SET @@GLOBAL.local_infile = 1;

LOAD DATA LOCAL INFILE "C:\\Users\\1\\Desktop\\SQL DATA\\Author.csv" INTO TABLE csproject.author_table
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Authorid, AuthorFirstName, AuthorLastName, AuthorNationality);

LOAD DATA LOCAL INFILE "C:\\Users\\1\\Desktop\\SQL DATA\\Book.csv" INTO TABLE csproject.book_table
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(bookid, booktitle, bookauthor, genre);

LOAD DATA LOCAL INFILE "C:\\Users\\1\\Desktop\\SQL DATA\\Client.csv" INTO TABLE csproject.client_table
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(clientid, clientfirstname, clientlastname, clientdob, clientoccupation);

LOAD DATA LOCAL INFILE "C:\\Users\\1\\Desktop\\SQL DATA\\Borrower.csv" INTO TABLE csproject.borrower_table
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(borrowerid, clientid, bookid, borrowdate);