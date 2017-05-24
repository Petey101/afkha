class GamesController < ApplicationController

	def create    		
		flash[:notice] = "She AFK now"
		if current_game
			flash[:notice] = "We already know she's AFK"
			redirect_to :back
		else 
			Game.create
			redirect_to :back
		end
	end

	def update
		if current_game && current_user
			if current_game.id == params[:id].to_i
				current_game.update(end_time: Time.now)
				redirect_to :back	
			else
				flash[:notice] = "Stop trying to break my stuff"	
				redirect_to :back
			end
		end
		
	end

end
 