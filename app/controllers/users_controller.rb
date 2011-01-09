class UsersController < ApplicationController

  skip_before_filter :authorize, :only => [ :new, :create ]

  # GET /users
  # GET /users.xml
  def index
    @users = User.order(:username)

    respond_to do |format|
      format.html # index.html.erb
      if current_user.is_admin?
        format.xml  { render :xml => @users }
      end
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    unless current_user.is_moderator? or @user == current_user
      redirect_to denied_path
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      if current_user.is_admin?
        format.xml  { render :xml => @user }
      end
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    unless current_user == @user or current_user.is_admin? 
      redirect_to denied_path
      return
    end
  end

  # POST /users
  # POST /users.xml
  def create
    # admin create, or new user registration
    unless current_user == nil or current_user.is_admin? 
      redirect_to denied_path
      return
    end
    @user = User.new(params[:user])

    unless current_user
        @user.role = Role.find_by_name('general_user')
    end

    respond_to do |format|
      if @user.save
        if current_user 
          # we're an admin user creating the account
          format.html { redirect_to(users_url, :notice => "User #{@user.name} was successfully created.") }
          format.xml  { render :xml => @user, :status => :created, :location => @user }
        else 
          # we've just registered
          format.html { redirect_to(login_url, :notice => "Your account has been created, please log in") }
          #format.xml  { render :xml => @user, :status => :created, :location => @user }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    # admin user, or editing own profile
    unless current_user.is_admin? or @user == current_user 
      redirect_to denied_path
      return
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { 
          redirect_to(users_url, 
            :notice => "User #{@user.name} was successfully updated.") 
          }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy

    # admin user only
    unless current_user.is_admin?
      redirect_to denied_path
      return
    end

    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
