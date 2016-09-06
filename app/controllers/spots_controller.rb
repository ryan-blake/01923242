class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_filter :login_required, unless: :current_user


  def index
    @spots = Spot.where(is_boat: nil)
  end

  def boats
    @boats = Spot.where(is_boat: true)
  end

  def show
    @events = Event.all
    @spot = Spot.find(params[:id])
    @boat = Spot.find(params[:id])

  end


  def new
    @spot = Spot.new(params[:spot_params])
    @user = current_user
  end

  def new_boat
    @spot = Spot.new(params[:spot_params])
    @user = current_user
  end

  def edit
    @boat = Spot.find(params[:id])
    if current_user
      @user = current_user
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
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


 def search
   if params[:value].to_i < 1
     distance_in_miles = 2000
   else
     distance_in_miles = params[:value].to_i
   end
 @spots = Spot.where("park_id like ? and term_id like ? and (title like ? or description like ?)",
           "%#{params[:park_id]}%", "%#{params[:term_id]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%") \
            .near([current_user.latitude, current_user.longitude], distance_in_miles)
  render :index
end

def search_boats
  if params[:value].to_i < 1
    distance_in_miles = 2000
  else
    distance_in_miles = params[:value].to_i
  end
@boats = Spot.where("lake_id like ? and term_id like ? and (title like ? or description like ?)",
          "%#{params[:lake_id]}%", "%#{params[:term_id]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%") \
           .near([current_user.latitude, current_user.longitude], distance_in_miles)
 render :boats
end




private

def login_required
  redirect_to user_session_path, notice: 'Please login'
end

def spot_params
  params.require(:spot).permit(:title, :description, :current_user, :price, :length, :width, :depth, :park, :term_id, :park_id,
   :user_id, :arrived, :spot_image, :address, :city, :zipcode, :state, :longitude, :latitude, :covered, :ramp, :is_boat, :lake_id, :type_id, :make, :propulsion_id, :occupants )
end


end
