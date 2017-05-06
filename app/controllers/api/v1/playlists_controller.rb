class Api::V1::PlaylistsController < ApplicationController
  before_action :authenticate_token!, only: [:show, :update]

  def show
  end

  def update
  end 
end
