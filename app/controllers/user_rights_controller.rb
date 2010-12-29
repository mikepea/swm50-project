class UserRightsController < ApplicationController
  # GET /user_rights
  # GET /user_rights.xml
  def index
    @user_rights = UserRight.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_rights }
    end
  end

  # GET /user_rights/1
  # GET /user_rights/1.xml
  def show
    @user_right = UserRight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_right }
    end
  end

  # GET /user_rights/new
  # GET /user_rights/new.xml
  def new
    @user_right = UserRight.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_right }
    end
  end

  # GET /user_rights/1/edit
  def edit
    @user_right = UserRight.find(params[:id])
  end

  # POST /user_rights
  # POST /user_rights.xml
  def create
    @user_right = UserRight.new(params[:user_right])

    respond_to do |format|
      if @user_right.save
        format.html { redirect_to(@user_right, :notice => 'User right was successfully created.') }
        format.xml  { render :xml => @user_right, :status => :created, :location => @user_right }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_right.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_rights/1
  # PUT /user_rights/1.xml
  def update
    @user_right = UserRight.find(params[:id])

    respond_to do |format|
      if @user_right.update_attributes(params[:user_right])
        format.html { redirect_to(@user_right, :notice => 'User right was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_right.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_rights/1
  # DELETE /user_rights/1.xml
  def destroy
    @user_right = UserRight.find(params[:id])
    @user_right.destroy

    respond_to do |format|
      format.html { redirect_to(user_rights_url) }
      format.xml  { head :ok }
    end
  end
end
