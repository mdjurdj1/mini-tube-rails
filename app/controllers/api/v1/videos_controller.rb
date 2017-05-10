class Api::V1::VideosController < ApplicationController
  before_action :authenticate_token!

  def index
    @playlists = current_user.playlists
    if @playlists
      render 'playlists/playlists.json.jbuilder', playlists: @playlists
    else
      render json: {
        errors: 'No playlists exist.'
      }, status: 500
    end
  end

  def create
    @video = PlaylistVideo.new(playlist_id: params[:playlist_id], current_user.playlists.new(playlist_params)
    if @playlist.save
      render 'playlists/playlist.json.jbuilder', playlists: @playlist
    else
      render json: {
        errors: @playlist.errors
      }, status: 500
    end
  end

  def show
    @playlist = current_user.playlists.find_by(id: params[:id])
    if @playlist && @playlist.user == current_user
      render 'playlists/playlist.json.jbuilder', playlists: @playlist
    else
      render json: {
        errors: "Unable to retrieve this playlist."
      }, status: 500
    end
  end

  def update
  end

  def destroy
    @playlist = current_user.playlists.find_by(id: params[:id])
    if @playlist && @playlist.user == current_user
      @playlist.destroy
      render json: {
        message: ['Playlist was successfully deleted.']
      }
    else
      render json: {
        errors: ['Unable to delete playlist.']
      }, status: 500
    end
  end

  private

  def video_params
    params.require(:video).permit(:name, :description)
  end

end
