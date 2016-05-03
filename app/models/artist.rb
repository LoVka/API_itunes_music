class Artist
  include Mongoid::Document

  field :name,  type: String
  field :itunes_id, type: Integer
  has_many :albums, primary_key: :itunes_id

  index({ itunes_id: 1 }, { unique: true })

  def as_json(opts = {})
    {
        type: 'artists',
        id: itunes_id,
        attributes: { name: name }
    }
  end
end