require 'spec_helper'

describe 'itunes' do
  include_context 'rake'
  before do
    stub_request(:get, 'https://itunes.apple.com/search?entity=musicArtist&limit=1&term=abba').
      to_return(status: 200, body: File.open(File.join('spec', 'fixtures', 'abba_artist.json')).read)

    stub_request(:get, 'https://itunes.apple.com/lookup?entity=album&id=372976').
      to_return(status: 200, body: File.open(File.join('spec', 'fixtures', 'abba_albums.json')).read)

    stub_request(:get, 'https://itunes.apple.com/search?entity=musicArtist&limit=1&term=_').
      to_return(:status => 200, body: '{"resultCount":0,"results":[]}')
  end

  it 'Saves artist and albums from Itunes API' do
    ENV['ARTIST'] = 'abba'
    task.invoke

    expect(Artist.count).to eq(1)
    expect(Artist.first.name).to eq('ABBA')
    expect(Album.count).to eq(22)
  end

  it 'raises error if environment variable ARTIST is blank' do
    ENV['ARTIST'] = ''
    expect { task.invoke }.to raise_error('Please provide environment variable ARTIST, ' \
      'e.g. rake itunes ARTIST=Abba')
  end

  it 'raises error if artist not found' do
    ENV['ARTIST'] = '_'
    expect { task.invoke }.to raise_error('Artist not found')
  end
end
