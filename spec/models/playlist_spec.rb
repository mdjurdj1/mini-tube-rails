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
    pending 'has many videos that are destroyed upon deletion of playlist'

    pending 'belongs to a user'
  end

end
