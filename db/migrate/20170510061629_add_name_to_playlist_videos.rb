class AddNameToPlaylistVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :playlist_videos, :name, :string
  end
end
