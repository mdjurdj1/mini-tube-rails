require 'rails_helper'

RSpec.describe Video, type: :model do

  describe 'validations' do

    it 'requires a videoId' do
      video = build(:video, videoId: nil)
      expect(video.valid?).to eq(false)
      expect(video.errors.full_messages).to eq([
        "Videoid can't be blank"
        ])
    end

  end

  describe 'relationships' do

    it 'has many playlist_videos' do
      video = create(:video)
      playlist = create(:playlist)
      playlist_video = playlist.playlist_videos.create(video: video)

      expect(video.playlist_videos.first).not_to eq(nil)
    end
  end
end
