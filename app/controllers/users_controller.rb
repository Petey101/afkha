class UsersController < ApplicationController

	def create
		@user = User.new(name: params[:user][:name])
		if @user.save
			session[:user_id] = @user.id
			redirect_to :back
		else
			@user = User.find_by_name(params[:user][:name])
			session[:user_id] = @user.id
			redirect_to :back
		
		end
	end

	def logout
		if current_user
			session.clear	
			redirect_to :back
		else
			flash[:notice] = "You are not logged on"
			redirect_to :back
		end
	end

end
