class CitiesController < ApplicationController

  skip_before_filter :authorize, :only => [ :show, :index ]

  # GET /cities
  # GET /cities.xml
  def index
    @cities = City.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cities }
    end
  end

  # GET /cities/1
  # GET /cities/1.xml
  def show
    @city = City.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @city }
    end
  end

  # GET /cities/new
  # GET /cities/new.xml
  def new

    # any registered user can add a city
    unless current_user.is_general_user?
      redirect_to denied_path
      return
    end

    @city = City.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @city }
    end
  end

  # GET /cities/1/edit
  def edit

    unless current_user.is_city_moderator?
      redirect_to denied_path
      return
    end

    @city = City.find(params[:id])
  end

  # POST /cities
  # POST /cities.xml
  def create

    # any registered user can add a city
    unless current_user.is_general_user?
      redirect_to denied_path
      return
    end

    @city = City.new(params[:city])
    @city.user_id = current_user.id

    respond_to do |format|
      if @city.save
        format.html { redirect_to(@city, :notice => 'City was successfully created.') }
        format.xml  { render :xml => @city, :status => :created, :location => @city }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cities/1
  # PUT /cities/1.xml
  def update
    unless current_user.is_city_moderator?
      redirect_to denied_path
      return
    end
    @city = City.find(params[:id])
    @city.user_id = current_user.id
    unless current_user.is_city_moderator?
      redirect_to denied_path
      return
    end

    respond_to do |format|
      if @city.update_attributes(params[:city])
        format.html { redirect_to(@city, :notice => 'City was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.xml
  def destroy
    unless current_user.is_city_moderator?
      redirect_to denied_path
      return
    end
    @city = City.find(params[:id])
    @city.destroy

    respond_to do |format|
      format.html { redirect_to(cities_url) }
      format.xml  { head :ok }
    end
  end
end
