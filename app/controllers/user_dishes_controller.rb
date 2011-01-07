class UserDishesController < ApplicationController

  skip_before_filter :authorize, :only => [ :create ]

  # POST /user_dishes
  # POST /user_dishes.xml
  def create

    dish = Dish.find(params[:user_dish])
    respond_to do |format|
      if dish
        session[:user_dish] = params[:user_dish]
        session[:user_location] = dish.location_id
        session[:user_city] = dish.location.city_id
        format.html { redirect_to(dish, :notice => 'Your current dish was successfully set.') }
        #format.xml  { render :xml => @user_dish, :status => :created, :location => @user_dish }
      else
        logger.error "Could not set :user_dish from #{params[:user_dish]}"
        return
      end
    end
  end

end
