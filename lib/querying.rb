def select_books_titles_and_years_in_first_series_order_by_year
  <<-SQL
  SELECT books.title, books.year
  FROM books
  ORDER BY books.year ASC LIMIT 3;
  SQL
end
##find way to actually select the first row


def select_name_and_motto_of_char_with_longest_motto
  <<-SQL
  SELECT characters.name, characters.motto 
  FROM characters
  ORDER BY LENGTH(characters.motto) DESC LIMIT 1;
  SQL
end

def select_value_and_count_of_most_prolific_species
  <<-SQL
  SELECT characters.species, COUNT(characters.species)
  FROM characters
  GROUP BY characters.species
  ORDER BY characters.species DESC LIMIT 1;
  SQL
end

def select_name_and_series_subgenres_of_authors
  <<-SQL
  SELECT authors.name, subgenres.name FROM series
  JOIN authors ON series.author_id = authors.id
  JOIN subgenres ON series.subgenre_id = subgenres.id
  GROUP BY authors.name;
  SQL
end

def select_series_title_with_most_human_characters
  <<-SQL
  SELECT series.title FROM series
  JOIN authors ON series.author_id = authors.id
  JOIN characters ON characters.author_id = authors.id
  WHERE characters.species = 'human'
  GROUP BY characters.species
  ORDER BY COUNT(characters.species) DESC LIMIT 1;
  SQL
end

def select_character_names_and_number_of_books_they_are_in
  <<-SQL
    SELECT characters.name, COUNT(books.title) AS count_books
    FROM character_books
    JOIN characters ON character_books.character_id = characters.id
    JOIN books ON character_books.book_id = books.id
    GROUP BY characters.name
    ORDER BY count_books DESC;
  SQL
end
