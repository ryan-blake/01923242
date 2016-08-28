class PagesController < ApplicationController
  def list
    @users = User.all
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
