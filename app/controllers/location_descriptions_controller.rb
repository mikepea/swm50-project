class LocationDescriptionsController < ApplicationController
  # GET /location_descriptions
  # GET /location_descriptions.xml
  def index
    @location_descriptions = LocationDescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @location_descriptions }
    end
  end

  # GET /location_descriptions/1
  # GET /location_descriptions/1.xml
  def show
    @location_description = LocationDescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location_description }
    end
  end

  # GET /location_descriptions/new
  # GET /location_descriptions/new.xml
  def new
    @location_description = LocationDescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location_description }
    end
  end

  # GET /location_descriptions/1/edit
  def edit
    @location_description = LocationDescription.find(params[:id])
  end

  # POST /location_descriptions
  # POST /location_descriptions.xml
  def create
    @location_description = LocationDescription.new(params[:location_description])

    respond_to do |format|
      if @location_description.save
        format.html { redirect_to(@location_description, :notice => 'Location description was successfully created.') }
        format.xml  { render :xml => @location_description, :status => :created, :location => @location_description }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location_description.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /location_descriptions/1
  # PUT /location_descriptions/1.xml
  def update
    @location_description = LocationDescription.find(params[:id])

    respond_to do |format|
      if @location_description.update_attributes(params[:location_description])
        format.html { redirect_to(@location_description, :notice => 'Location description was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location_description.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /location_descriptions/1
  # DELETE /location_descriptions/1.xml
  def destroy
    @location_description = LocationDescription.find(params[:id])
    @location_description.destroy

    respond_to do |format|
      format.html { redirect_to(location_descriptions_url) }
      format.xml  { head :ok }
    end
  end
end
