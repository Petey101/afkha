class GamesController < ApplicationController

	def create    		
		flash[:notice] = "She AFK now"
		if Game.find_by(end_time: nil)
			flash[:notice] = "We already know she's AFK"
			redirect_to :back
		else 
			Game.create
			redirect_to :back
		end
	end

#Game.find_by(end_time: nil)
#Game.first.update(end_time:Time.now)
end
 