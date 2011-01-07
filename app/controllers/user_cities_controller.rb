class UserCitiesController < ApplicationController

  skip_before_filter :authorize, :only => [ :create ]

  # POST /user_cities
  # POST /user_cities.xml
  def create

    city = City.find(params[:user_city])
    respond_to do |format|
      if city
        session[:user_city] = params[:user_city]
        session[:user_location] = nil
        session[:user_dish] = nil
        format.html { redirect_to(locations_path(:city_id => city), :notice => 'Your current city was successfully set.') }
        format.xml  { render :xml => @user_city, :status => :created, :city => @user_city }
      else
        logger.error "Could not set :user_city from #{params[:user_city]}"
        return
      end
    end
  end

end
