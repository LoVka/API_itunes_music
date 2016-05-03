class Api::AlbumsController < ApplicationController

  def index
    param! :artist_id, Integer, required: true, min: 1
    almbums = Album.where(artist: params[:artist_id]).as_json
    render json: {data: almbums}
  end
end