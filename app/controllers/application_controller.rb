class ApplicationController < ActionController::Base

  before_filter :req_uri_saver
  before_filter :current_user
  before_filter :current_city
  before_filter :current_location
  before_filter :current_dish
  before_filter :authorize

  protect_from_forgery

  helper_method :current_user
  helper_method :current_city
  helper_method :current_location
  helper_method :current_dish

  private

    # Who is logged in?
    def req_uri_saver
        session[:prev_dest] = session[:dest]
        session[:dest] = request.env['REQUEST_URI']
    end

    # Who is logged in?
    def current_user
      if session[:user_id]
        User.find(session[:user_id])
      end
    end

    # Where is the person?
    def current_city
      if session[:user_city]
        City.find(session[:user_city])
      end
    end

    # Where is the person?
    def current_location
      if session[:user_location]
        Location.find(session[:user_location])
      end
    end

    # What do they intend to eat/review?
    def current_dish
      if session[:user_dish]
        Dish.find(session[:user_dish])
      end
    end

  protected
    def authorize
      user = User.find_by_id(session[:user_id])
      unless user
        session[:pre_login_req_uri] = request.env['REQUEST_URI']
        redirect_to login_url, :notice => "You need to log in to access this page."
      end
    end

end
