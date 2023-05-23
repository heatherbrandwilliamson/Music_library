require_relative './artist'

class ArtistRepository
    def all
        sql = 'SELECT id, name, genre FROM artists;'
       result_set = DatabaseConnection.exec_params(sql, []) 

       artists = []

        result_set.each do |record|
            artist = Artists.new
            artist.id = record['id']
            artist.name = record['name']
            artist.genre = record['genre']

            artists << artist

            return artists
        end
    end
end