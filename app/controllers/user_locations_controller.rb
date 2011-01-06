class UserLocationsController < ApplicationController
  # GET /user_locations
  # GET /user_locations.xml
  def index
    @user_locations = UserLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_locations }
    end
  end

  # GET /user_locations/1
  # GET /user_locations/1.xml
  def show
    @user_location = UserLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_location }
    end
  end

  # GET /user_locations/new
  # GET /user_locations/new.xml
  def new
    @user_location = UserLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_location }
    end
  end

  # GET /user_locations/1/edit
  def edit
    @user_location = UserLocation.find(params[:id])
  end

  # POST /user_locations
  # POST /user_locations.xml
  def create
    @user_location = UserLocation.new(params[:user_location])

    respond_to do |format|
      if @user_location.save
        format.html { redirect_to(@user_location, :notice => 'User location was successfully created.') }
        format.xml  { render :xml => @user_location, :status => :created, :location => @user_location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_locations/1
  # PUT /user_locations/1.xml
  def update
    @user_location = UserLocation.find(params[:id])

    respond_to do |format|
      if @user_location.update_attributes(params[:user_location])
        format.html { redirect_to(@user_location, :notice => 'User location was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_locations/1
  # DELETE /user_locations/1.xml
  def destroy
    @user_location = UserLocation.find(params[:id])
    @user_location.destroy

    respond_to do |format|
      format.html { redirect_to(user_locations_url) }
      format.xml  { head :ok }
    end
  end
end
