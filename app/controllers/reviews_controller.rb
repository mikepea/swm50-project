class ReviewsController < ApplicationController

  skip_before_filter :authorize, :only => [ :index, :show ]

  uses_tiny_mce

  # GET /reviews
  # GET /reviews.xml
  def index

    if params[:dish_id]
        @dish = Dish.find(params[:dish_id])
    else
        @dish = current_dish
    end

    if @dish
        @reviews = Review.find_all_by_dish_id(@dish) || Array.new
        logger.info "reviews: " + @reviews.inspect
    else
        @reviews = Review.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.xml
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.xml
  def new
    # any registered user can add a location
    unless current_user.is_general_user?
      redirect_to denied_path
      return
    end

    @review = Review.new
    logger.info "review.new params: " + params.inspect
    if params[:dish_id]
        @dish = Dish.find(params[:dish_id])
    else
        @dish = current_dish
    end
    @review.dish_id = @dish.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    unless current_user.is_review_moderator?
      redirect_to denied_path
      return
    end
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.xml
  def create
    # any registered user can add a review
    unless current_user.is_general_user?
      redirect_to denied_path
      return
    end

    @review = Review.new(params[:review])
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to(@review, :notice => 'Review was successfully created.') }
        format.xml  { render :xml => @review, :status => :created, :location => @review }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.xml
  def update
    @review = Review.find(params[:id])
    unless current_user.is_review_moderator? or current_user = @review.user
      redirect_to denied_path
      return
    end

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to(@review, :notice => 'Review was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.xml
  def destroy
    unless current_user.is_review_moderator?
      redirect_to denied_path
      return
    end

    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to(reviews_url) }
      format.xml  { head :ok }
    end
  end

end
