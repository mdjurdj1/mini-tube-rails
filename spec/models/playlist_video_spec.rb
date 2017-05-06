require 'rails_helper'

RSpec.describe PlaylistVideo, type: :model do

  describe 'validations' do
    it 'requires a video and playlist' do
      playlist_video = PlaylistVideo.new

      expect(playlist_video.valid?).to equal(false)
      expect(playlist_video.errors.full_messages).to eq([
        "Video must exist",
        "Playlist must exist",
        ])
    end
  end

  describe 'relationships' do
    it 'belongs to a playlist' do

    end

    it 'belongs to a video' do
    end
  end

end
