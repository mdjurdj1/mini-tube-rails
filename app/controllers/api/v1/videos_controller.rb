class Api::V1::VideosController < ApplicationController
  before_action :authenticate_token!, :find_playlist

  def index
    @playlist_videos = @playlist.playlist_videos
    if @playlist_videos
      render 'videos/videos.json.jbuilder', playlist_videos: @playlist_videos
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
    @video = PlaylistVideo.find_by(playlist_id: params[:playlist_id])
    if @video
      @video.destroy
      render json: {
        message: ['Video was successfully deleted from playlist.']
      }
    else
      render json: {
        errors: ['Unable to delete video.']
      }, status: 500
    end
  end

  private

  def video_params
    params.require(:video).permit(:name, :videoId, :playlist_id)
  end

  def find_playlist
    @playlist = current_user.playlists.find_by(id: params[:playlist_id])
  end

end
