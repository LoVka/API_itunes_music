class Api::ArtistsController < ApplicationController

  def index
    render json: {data: Artist.all.as_json}
  end

end