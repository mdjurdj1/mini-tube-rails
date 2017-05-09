class Api::V1::PlaylistsController < ApplicationController
  before_action :authenticate_token!, only: [:show, :create, :update]

  def index
    @playlists = current_user.playlists.all
    if @playlists
      render 'playlists/playlists.json.jbuilder', playlists: @playlists
    else
      render json: {
        errors: 'No playlists exist.'
      }, status: 500
    end
  end

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
