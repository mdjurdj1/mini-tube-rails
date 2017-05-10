class Api::V1::VideosController < ApplicationController
  before_action :authenticate_token!, :find_playlist

  def index
    @videos = @playlist.videos
    if @videos
      render 'playlists/videos.json.jbuilder', videos: @videos
    else
      render json: {
        errors: 'No videos found.'
      }, status: 500
    end
  end

  def create
    @video = Video.new(video_params)
    if @video.save && @playlist
      @playlist_video = PlaylistVideo.new(name: params[:video][:name], videoId: @video.videoId, video_id: @video.id, playlist_id: @playlist.id)
      @playlist_video.save
     render json: {
       success: ['Video was saved.']
     }, status: 200
    else
      render json: {
        errors: @video.errors
      }, status: 500
    end
  end

  def show
    # @playlist = current_user.playlists.find_by(id: params[:id])
    # if @playlist && @playlist.user == current_user
    #   render 'playlists/playlist.json.jbuilder', playlists: @playlist
    # else
    #   render json: {
    #     errors: "Unable to retrieve this playlist."
    #   }, status: 500
    # end
  end

  def update
  end

  def destroy
    # @playlist = current_user.playlists.find_by(id: params[:id])
    # if @playlist && @playlist.user == current_user
    #   @playlist.destroy
    #   render json: {
    #     message: ['Playlist was successfully deleted.']
    #   }
    # else
    #   render json: {
    #     errors: ['Unable to delete playlist.']
    #   }, status: 500
    # end
  end

  private

  def video_params
    params.require(:video).permit(:name, :videoId, :playlist_id)
  end

  def find_playlist
    @playlist = current_user.playlists.find_by(id: params[:playlist_id])
  end

end
