class PagesController < ApplicationController
  def home
    @spots = Spot.all
    @charge  = Charge.new
  end

  def spots
    @user = current_user
    if @user
      @spots = Spot.where(user_id: @user.id)
    end
  end
end