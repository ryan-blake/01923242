class PagesController < ApplicationController
  def list
    @users = User.all
    @spots = Spot.all
    @charge  = Charge.new

  end

  def spots
    @user = current_user
    @charge = Charge.where(user_id: @user)
    if @user && @charge
        @spots = Spot.find_by(title: @charge )
    end
  end
end
