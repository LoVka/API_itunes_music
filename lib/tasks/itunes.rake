desc 'Saving artist and albums from Itunes API, uses environment variable ARTIST'
task itunes: :environment do
  fail 'Please provide environment variable ARTIST, e.g. rake itunes ARTIST=Abba' if ENV['ARTIST'].blank?
  require 'itunes-search-api'

  artist_hash = ITunesSearchAPI.search(term: ENV['ARTIST'], entity: 'musicArtist', limit: 1).first
  fail "Artist not found" unless artist_hash
  artist      = Artist.find_or_create_by(itunes_id: artist_hash['artistId']) do |ar|
    ar.name = artist_hash['artistName']
    puts "Created artist #{ar.name}"
  end

  albums = ITunesSearchAPI.lookup(id: artist.itunes_id, entity: 'album')

  albums.each do |album|
    artist.albums.find_or_create_by(collection_id: album['collectionId']) do |al|
      al.name            = album['collectionName']
      al.artwork_url_100 = album['artworkUrl100']
      puts "Created album #{al.name}"
    end if album['wrapperType'] == 'collection'
  end
end