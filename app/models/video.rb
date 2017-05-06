class Video < ApplicationRecord
  has_many :playlist_videos

  validates :videoId, presence: true
end
