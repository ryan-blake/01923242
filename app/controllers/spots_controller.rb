class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_filter :login_required, unless: :current_user


  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @events = Event.all
  end


  def new
    @spot = Spot.new(params[:spot_params])
    @user = current_user

  end

 def create
  @spot = Spot.new(spot_params)

  respond_to do |format|
    if @spot.save
      format.html { redirect_to @spot, notice: 'Spot was successfully created.' }
      format.json { render :show, status: :created, location: @spot }
    else
      format.html { render :new }
      format.json { render json: @spot.errors, status: :unprocessable_entity }
    end
  end
end


  def edit
    @spot = Spot.find(params[:id])
    if current_user
      @user = current_user
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def update
    @spot = Spot.find(params[:id])
    if !params[:spot]
      flash[:error] = "You didn't select an update!"
      redirect_to [@spot]
      return
    end

    if @spot.update_attributes(spot_params)
      flash[:notice] = "Listing was updated."
      # #37
      redirect_to [@spot]
    else
      flash[:error] = "There was an error saving the listing. Please try again."
      render :edit
    end
  end


  def destroy
  # require current_client
  @spot = Spot.find(params[:id])
  @spot.destroy
  respond_to do |format|
    format.html { redirect_to root_url, notice: 'Spot was successfully destroyed.' }
    format.json { head :no_content }
   end
 end



private

def login_required
  redirect_to user_session_path, notice: 'Please login'
end

def spot_params
  params.require(:spot).permit(:title, :description, :current_user, :price, :length, :width, :depth, :park, :term_id, :park_id, :user_id, :arrived, :spot_image)
end


end
