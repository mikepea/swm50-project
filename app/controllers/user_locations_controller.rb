class UserLocationsController < ApplicationController

  skip_before_filter :authorize, :only => [ :create ]

  # GET /user_locations
  # GET /user_locations.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_locations }
    end
  end

  # POST /user_locations
  # POST /user_locations.xml
  def create

    location = Location.find(params[:user_location])
    respond_to do |format|
      if location
        session[:user_location] = params[:user_location]
        session[:user_dish] = nil
        format.html { redirect_to(location, :notice => 'Your current location was successfully set.') }
        #format.xml  { render :xml => @user_location, :status => :created, :location => @user_location }
      else
        logger.error "Could not set :user_location from #{params[:user_location]}"
        return
      end
    end
  end

end
