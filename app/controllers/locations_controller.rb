class LocationsController < ApplicationController

  skip_before_filter :authorize, :only => [ :index, :show ]

  uses_tiny_mce
 
  # GET /locations
  # GET /locations.xml
  def index

    if params[:city_id]
        @city = City.find(params[:city_id])
    else
        @city = current_city
    end

    if @city
        @locations = Location.find_all_by_city_id(@city) || Array.new
    else
        @locations = Location.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end

  end

  # GET /locations/1
  # GET /locations/1.xml
  def show

    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new

    # any registered user can add a location
    unless current_user.is_general_user?
      redirect_to denied_path
      return
    end

    @location = Location.new
    @location.current_description = ""
    if params[:city_id]
        @city = City.find(params[:city_id])
    else
        @city = current_city
    end
    @location.city_id = @city.id

    logger.info "new location: #{location.inspect}"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @review }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
    unless current_user.is_location_moderator? or current_user == @location.user
      redirect_to denied_path
      return
    end
  end

  # POST /locations
  # POST /locations.xml
  def create
    # any registered user can add a location
    unless current_user.is_general_user?
      redirect_to denied_path
      return
    end

    @location = Location.new(params[:location])
    @location.user_id = current_user.id

    respond_to do |format|
      if @location.save
        format.html { redirect_to(@location, :notice => 'Location was successfully created.') }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])
    # 'owner' of location can change it too.
    unless current_user.is_location_moderator? or current_user == @location.user
      redirect_to denied_path
      return
    end

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to(@location, :notice => 'Location was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    unless current_user.is_location_moderator?
      redirect_to denied_path
      return
    end
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
end
