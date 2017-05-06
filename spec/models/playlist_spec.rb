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
    # it 'has many videos that are destroyed upon deletion of playlist' do
    #   user = create(:user)
    #   playlist = user.playlists.create(name: 'Rap Musicz', description: 'Muh Rap Songs')
    #
    #   expect(user.playlists.first).not_to eq(nil)
    #
    #   user.destroy
    #   playlist = Playlist.find_by(id: playlist.id)
    #
    #   expect(playlist).to eq(nil)
    end

    it 'belongs to a user' do
      playlist = create(:playlist)

      expect(playlist.user.email).to eq("mdjurdj1@gmail.com")
    end
  end

end
