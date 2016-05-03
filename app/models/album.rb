class Album
  include Mongoid::Document

  field :name, type: String
  field :artwork_url_100, type: String
  field :collection_id, type: Integer
  belongs_to :artist, primary_key: :itunes_id, index: true

  index({ collection_id: 1 }, { unique: true })

  def as_json(opts = {})
    {
        type: 'albums',
        id: collection_id,
        attributes: { name: name, thumb: artwork_url_100 }
    }
  end
end