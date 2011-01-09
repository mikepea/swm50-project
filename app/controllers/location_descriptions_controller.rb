class LocationDescriptionsController < ApplicationController

  # POST /location_descriptions
  # POST /location_descriptions.xml
  def create

    # any registered user can add a location
    unless current_user.is_general_user?
      redirect_to denied_path
      return
    end

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
    unless current_user.is_location_moderator?
      redirect_to denied_path
      return
    end

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
    unless current_user.is_location_moderator?
      redirect_to denied_path
      return
    end

    @location_description = LocationDescription.find(params[:id])
    @location_description.destroy

    respond_to do |format|
      format.html { redirect_to(location_descriptions_url) }
      format.xml  { head :ok }
    end
  end
end
