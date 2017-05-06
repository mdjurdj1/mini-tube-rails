class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_videos, dependent: :destroy
  has_many :videos, through: :playlist_videos

  def add_video(video)
    existing_video = self.videos.find_by(videoId: video.videoId)
    unless existing_video
      self.playlist_videos.create(video_id: video.id)
    end
  end

  def video_count
    self.videos.count
  end
end
