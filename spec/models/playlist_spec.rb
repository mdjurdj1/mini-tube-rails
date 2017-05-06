require 'rails_helper'

RSpec.describe Playlist, type: :model do

  describe 'validations' do
    it 'requires a user upon creation' do
      playlist = build(:playlist, user: nil)

      expect(playlist.valid?).to eq(false)
      expect(playlist.errors.full_messages).to eq([
        'User must exist'
      ])
    end
  end

  describe 'relationships' do

    it 'has many playlist_videos that are destroyed upon deletion of playlist' do
      playlist = create(:playlist)
      video = create(:video)
      playlist_video = playlist.playlist_videos.create(video: video)

      expect(playlist.playlist_videos.first.id).not_to eq(nil)

      playlist.destroy
      playlist_video = PlaylistVideo.find_by(id: playlist_video.id)

      expect(playlist_video).to eq(nil)
    end

    it 'has many videos through playlist videos' do
      playlist = create(:playlist)
      video = create(:video)
      playlist_video = playlist.playlist_videos.create(video: video)

      expect(playlist.videos.count).to eq(1)
    end

    it 'belongs to a user' do
      playlist = create(:playlist)

      expect(playlist.user.email).to eq("mdjurdj1@gmail.com")
    end
  end

  describe 'instance methods' do

    before(:each) do
      @playlist = create(:playlist)
    end

    describe 'add_video' do

      it 'adds a video to the playlist' do
        video = create(:video)
        @playlist.add_video(video)

        expect(@playlist.playlist_videos.count).to eq(1)
      end

      it 'does not allow duplicate videos to be saved to a single playlist' do
        video = create(:video)
        video2 = create(:video)
        @playlist.add_video(video)
        @playlist.add_video(video2)

        expect(@playlist.playlist_videos.count).to eq(1)
      end

    end

    describe 'video_count' do

      it "correctly calculates the total count of a playlist's videos" do
        video = create(:video)
        video2 = Video.create(videoId: '325252hdh')
        video3 = create(:video)
        @playlist.add_video(video)
        @playlist.add_video(video2)
        @playlist.add_video(video3)

        expect(@playlist.video_count).to eq(2)
    end
  end
end

end
