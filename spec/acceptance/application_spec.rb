require 'spec_helper'

describe 'API' do
  describe 'GET /api/artists' do
    specify 'Fetching all artists' do
      Artist.create(name: 'Abba', itunes_id: 372976)

      get '/api/artists'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq('{"data":[{"type":"artists","id":372976,"attributes":{"name":"Abba"}}]}')
    end
  end

  describe 'GET /api/albums' do
    specify 'Fetching albums by artist' do
      Album.create(collection_id: 850009855, name: 'Gold: Greatest Hits', artwork_url_100: 'http://example.com', artist_id: 372976)
      Album.create(collection_id: 973555620, name: 'Drones', artist_id: 1093360)

      get '/api/albums?artist_id=372976'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq('{"data":[{"type":"albums","id":850009855,"attributes":{"name":"Gold: Greatest Hits","thumb":"http://example.com"}}]}')
    end

    it 'returns validation error if parameter artist_id is missed' do
      get '/api/albums'
      expect(last_response.status).to eq(400)
      expect(last_response.body).to eq('{"message":"Parameter is required - artist_id"}')
    end

    it 'returns validation error if provided artist_id less then 1' do
      get '/api/albums?artist_id=0'
      expect(last_response.status).to eq(400)
      expect(last_response.body).to eq('{"message":"Parameter cannot be less than 1 - artist_id"}')
    end
  end
end
