class DishesController < ApplicationController

  skip_before_filter :authorize, :only => [ :index, :show ]

  uses_tiny_mce

  # GET /dishes
  # GET /dishes.xml
  def index

    if params[:location_id]
        @location = Location.find(params[:location_id])
    else
        @location = current_location
    end

    if @location
        @dishes = Dish.find_all_by_location_id(@location) || Array.new
        logger.info "dishes: " + @dishes.inspect
    else
        @dishes = Dish.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dishes }
    end
  end

  # GET /dishes/1
  # GET /dishes/1.xml
  def show
    @dish = Dish.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dish }
    end
  end

  # GET /dishes/new
  # GET /dishes/new.xml
  def new
    # any registered user can add a location
    unless current_user.is_general_user?
      redirect_to denied_path
      return
    end

    @dish = Dish.new
    logger.info "dishes#new params: " + params.inspect
    if params[:location_id]
        @location = Location.find(params[:location_id])
    else
        @location = current_location
    end
    @dish.location_id = @location.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dish }
    end
  end

  # GET /dishes/1/edit
  def edit
    @dish = Dish.find(params[:id])
    unless current_user.is_dish_moderator? or current_user == @dish.user
      redirect_to denied_path
      return
    end
  end

  # POST /dishes
  # POST /dishes.xml
  def create
    # any registered user can add a location
    unless current_user.is_general_user?
      redirect_to denied_path
      return
    end

    @dish = Dish.new(params[:dish])
    @dish.user_id = current_user.id

    respond_to do |format|
      if @dish.save
        format.html { redirect_to(@dish, :notice => 'Dish was successfully created.') }
        format.xml  { render :xml => @dish, :status => :created, :location => @dish }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dishes/1
  # PUT /dishes/1.xml
  def update
    unless current_user.is_dish_moderator?
      redirect_to denied_path
      return
    end
    @dish = Dish.find(params[:id])
    @dish.user_id = current_user.id

    respond_to do |format|
      if @dish.update_attributes(params[:dish])
        format.html { redirect_to(@dish, :notice => 'Dish was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.xml
  def destroy
    unless current_user.is_dish_moderator?
      redirect_to denied_path
      return
    end
    @dish = Dish.find(params[:id])
    @dish.destroy

    respond_to do |format|
      format.html { redirect_to(dishes_url) }
      format.xml  { head :ok }
    end
  end
end
