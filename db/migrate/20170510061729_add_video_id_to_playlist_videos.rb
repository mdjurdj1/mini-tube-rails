class AddVideoIdToPlaylistVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :playlist_videos, :videoId, :string
  end
end
