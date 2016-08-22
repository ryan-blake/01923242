class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end


end
