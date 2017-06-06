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
				min_difference = current_game.guesses.map {|s| s[:minutes]}.reduce(0, :+)
				binding.pry
				current_game.guesses.each do |x|
					total_sales = sales.map {|s| s['sale_price']}.reduce(0, :+)
				end
				current_game.update(end_time: Time.now)
				redirect_to :back	
			else
				flash[:notice] = "Stop trying to break my stuff"	
				redirect_to :back
			end
		end
		
	end

end
 