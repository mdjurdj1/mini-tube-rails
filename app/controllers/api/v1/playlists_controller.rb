class Api::V1::PlaylistsController < ApplicationController
  before_action :authenticate_token!, only: [:show, :create, :update]

  def create
    @playlist = current_user.playlists.new(playlist_params)
    if @playlist.save
      render 'playlists/playlist.json.jbuilder', playlists: @playlist
    else
      render json: {
        errors: @playlist.errors
      }, status: 500
    end
  end

  def show
  end

  def update
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :description)
  end
  
end
