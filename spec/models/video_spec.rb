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
end
