# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'

DatabaseConnection.connect('music_library')

#sql = 'SELECT id, title FROM albums;'
#result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
#result.each do |record|
#  p record
#end

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
#result.each do |record|
#  p record
#end


artist_repository = ArtistRepository.new

#artist_repository.all.each do |artist|
#  p artist.id, artist.name, artist.genre
#end 

repo = ArtistRepository.new
artist = repo.find(1)
puts artist.name

# Perform a SQL query on the database and get the result set.
#sql = 'SELECT id, title FROM albums;'
#result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .

# We need to give the database name to the method `connect`.
#DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
#sql = 'SELECT id, title FROM albums;'
#result = DatabaseConnection.exec_params(sql, [])


#artist_repository = ArtistRepository.new

#p artist_repository.all

# Print out each record from the result set .
#result.each do |record|
#  p record
#end