# Artist Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

Table: 
albums 

Columns:
id | title | release_year | artist_id 

Table: 
artists 

Columns:
id | name | genre


## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE artists RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists (name, cohort_name) VALUES ('David', 'April 2022');
INSERT INTO artists (name, cohort_name) VALUES ('Anna', 'May 2022');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name_test < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby

Table name: artists
Table name: albums

Model class
(in lib/artists.rb)

class Artists
end

Repository class
(in lib/artsits_repository.rb)
class ArtistsRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: artists

# Model class
# (in lib/artist.rb)

class Artists
  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :cohort_name
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# artist = artist.new
# artist.name = 'Jo'
# artist.name
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: artits

# Repository class
# (in lib/artists_repository.rb)

class ArtistsRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists;

    # Returns an array of Artist objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
        # The placeholder $1 is a "parameter" of the SQL query.
        # It needs to be matched to the corresponding element 
        # of the array given in second argument to exec_params.
        # (If we needed more parameters, we would call them $2, $3...
        # and would need the same number of values in the params array).
        sql = 'SELECT name, cohort_name FROM students WHERE id = $1;'
        params = [id]
        result = DatabaseConnection.exec_params(sql, params)
        return result # returns a single artist object 
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(artist)
  # end

  # def update(artist)
  # end

  # def delete(artist)
  # end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby

# 1 
# get all artists 

repo = ArtistRepository.new

artists = repo.all # 
artists.length => 2 
artsits.first.id => '1'
artsits.first.name => 'Pixies'

EXAMPLES BELOW
repo = ArtistRepository.new
artists = repo.all
artists.length # =>  2
artists[0].id # =>  1
artists[0].name # =>  'David'
artists[0].cohort_name # =>  'April 2022'

artists[1].id # =>  2
artists[1].name # =>  'Anna'
artists[1].cohort_name # =>  'May 2022'

# 2
# Get a single artist

repo = ArtistRepository.new
artist = repo.find(1)
artist.id # =>  1
artist.name # =>  'Pixies'
artist.genre # =>  'Pop'

repo = ArtistRepository.new
artist = repo.find(2)
artist.id # =>  2
artist.name # =>  'Johannes Brahms'
artist.genre # =>  'Classical'


# Add more examples for each method
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/artist_repository_spec.rb

def reset_artists_table
  seed_sql = File.read('spec/seeds_artists.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'artists' })
  connection.exec(seed_sql)
end

describe ArtistRepository do
  before(:each) do 
    reset_artists_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->




<!-- END GENERATED SECTION DO NOT EDIT -->