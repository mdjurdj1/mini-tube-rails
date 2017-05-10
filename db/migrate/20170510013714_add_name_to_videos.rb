class AddNameToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :name, :string
  end
end
