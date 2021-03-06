class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_game
	private
	def current_user
    	return unless session[:user_id]
    	#@current_user ||= User.find(session[:user_id])
    	if User.find_by_id(session[:user_id])
    		@current_user = User.find(session[:user_id])
    	else
    		flash[:notice] = "User not found"
    		return
    	end
    end

    def current_game
    	Game.find_by(end_time: nil)
    end

    

  
end
