require 'spec_helper'

RSpec.describe Artist, type: :model do
  it { is_expected.to have_fields(:name).of_type(String) }
  it { is_expected.to have_fields(:itunes_id).of_type(Integer) }
  it { is_expected.to have_index_for(itunes_id: 1).with_options(unique: true) }
  it { is_expected.to have_many(:albums).of_type(Album).with_foreign_key(:artist_id) }

  describe '#as_json' do
    subject { Artist.new(name: 'Abba', itunes_id: 372976) }

    it 'returns hash with itunes_id as id and attributes nested hash' do
      expect(subject.as_json).to eq({
        type: 'artists',
        id: 372976,
        attributes: { name: 'Abba' }
      })
    end
  end
end
