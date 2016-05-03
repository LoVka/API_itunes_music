require 'spec_helper'

RSpec.describe Album, type: :model do
  it { is_expected.to have_fields(:collection_id).of_type(Integer) }
  it { is_expected.to have_fields(:name, :artwork_url_100).of_type(String) }
  it { is_expected.to have_index_for(collection_id: 1).with_options(unique: true) }
  it { is_expected.to belong_to(:artist).of_type(Artist).with_foreign_key(:artist_id).with_index }

  describe '#as_json' do
    subject { Album.new(collection_id: 850009855, name: 'Gold: Greatest Hits',
      artwork_url_100: 'http://example.com', artist_id: 372976) }

    it 'returns hash with collection_id as id and attributes nested hash' do
      expect(subject.as_json).to eq({
        type: 'albums',
        id: 850009855,
        attributes: { name: 'Gold: Greatest Hits', thumb: 'http://example.com' }
      })
    end
  end
end
