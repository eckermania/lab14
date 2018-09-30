-- Create the bookshelves table

CREATE TABLE bookshelves (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- Grab unique bookshelves values from books table and put into bookshelves table

INSERT INTO bokshelves(name) SELECT DISTINCT bookshelf FROM books;

-- Add a field to the books table that is an id for bookshelf

ALTER TABLE books ADD COLUMN bookshelf_id INT;

-- Populate new field with bookshelf primary keys

UPDATE books SET bookshelf_id*subquery.id FROM (SELECT * FROM bookshelves) AS subquery WHERE books.bookshelf = subquery.name;

-- Remove the bookshelf table from the books table

ALTER TABLE books DROP COLUMN bookshelf;

-- Make the bookshelf_id the foreign key of the books table

ALTER TABLE books ADD CONSTRAINT fk_bookshelf FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);

