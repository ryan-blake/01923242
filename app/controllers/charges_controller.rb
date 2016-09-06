class ChargesController < ApplicationController
  def new
  end

  def complete
    @charge = Charge.find(params[:charge_id])
    @spot = Spot.find_by(user_id: @charge.user_id, arrived: false, title: @charge.item)

    Stripe.api_key = ENV["stripe_api_key"]
    token = params[:token]
    charge = Stripe::Charge.create({
      :amount => @charge.price*100,
      :description => 'Rails Stripe customer',
      :customer => params[:customer_id],
      :currency => 'usd',
      :destination => @charge.vendor.uid,
      :application_fee => 200+(@charge.price*3)+ 31
      },
    )
    @charge.update_attribute(:completed, true)
    @spot.update_attribute(:arrived, true)



    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end

  def create
    
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card => params[:stripeToken]
    )
    @charge = Charge.new(
    price: params[:charge]["amount"].to_i,
    user_id: current_user.id,
    vendor_id: params[:charge]["owner_id"].to_i,
    item: params[:charge]["item"],
    token: params[:stripeToken],
    customer_id: customer.id,
    completed: false
    )
    @charge.save

    @spot = Spot.where(title: @charge.item).first
    @spot.user_id = @charge.user_id
    @spot.arrived = false
    @spot.save
  end
end
