# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'

DatabaseConnection.connect('music_library')

artist_repository = ArtistRepository.new

# Perform a SQL query on the database and get the result set.
#sql = 'SELECT id, title FROM albums;'
#result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
artist_repository.all.each do |artist|
  p artist
end

# We need to give the database name to the method `connect`.
#DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
#sql = 'SELECT id, title FROM albums;'
#result = DatabaseConnection.exec_params(sql, [])

artist_repository = ArtistRepository.new

#p artist_repository.all

# Print out each record from the result set .
#result.each do |record|
#  p record
#end