require_relative './artist'

class ArtistRepository
    def all
    sql = 'SELECT id, name, genre FROM artists;'
    result_set = DatabaseConnection.exec_params(sql, []) 
    artists = []
      result_set.each do |record|
          artist = Artist.new
          artist.id = record['id']
          artist.name = record['name']
          artist.genre = record['genre']
        
          artists << artist
   
        end
      return artists
    end 

      def find(id)
        # The placeholder $1 is a "parameter" of the SQL query.
        # It needs to be matched to the corresponding element 
        # of the array given in second argument to exec_params.
        # (If we needed more parameters, we would call them $2, $3...
        # and would need the same number of values in the params array).
        sql = 'SELECT id, name, genre FROM artists WHERE id = $1;'
        sql_params = [id]
        result_set = DatabaseConnection.exec_params(sql, sql_params)

        record = result_set[0]
        artist = Artist.new
        artist.id = record['id']
        artist.name = record['name']
        artist.genre = record['genre']
        # result_set.each.do |record|
 # (The code now needs to convert the result to a
    # Student object and return it)


        return artist
      end
end

