require 'artist_repository'


RSpec.describe ArtistRepository do 
    def reset_artists_table
        seed_sql = File.read('spec/seeds_artists.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
      end

    before(:each) do 
        reset_artists_table
    end

    it 'returns the list of artists' do 
        
        repo = ArtistRepository.new
        artist = repo.all  # is this artists or artist 

        expect(artist.length).to eq(2)
        expect(artist.first.id).to eq('1')
        expect(artist.first.name).to eq('Pixies')

    end

# Second test here - find method 
    it 'returns a single artist' do 
        repo = ArtistRepository.new 
        artist = repo.find(1)

        expect(artist.name).to eq('Pixies')
        expect(artist.genre).to eq('Pop')
    end

    it 'returns another single artist' do 
        repo = ArtistRepository.new 
        artist = repo.find(2)
        
        expect(artist.name).to eq('Johannes Brahms')
        expect(artist.genre).to eq('Classical')
    end

end
