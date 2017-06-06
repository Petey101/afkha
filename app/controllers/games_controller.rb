class GamesController < ApplicationController

	def create    		
		flash[:notice] = "She's AFK now"
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
				min_difference = (Time.now - current_game.created_at) / 60
				afk_time = (Time.now - current_game.created_at) / 60
				winner =[]
				current_game.guesses.each do |guess|
					if (afk_time - guess.minutes).abs < min_difference
						min_difference = (afk_time - guess.minutes).abs
						winner = guess
					end
				end
				winner.user.points += 1
				winner.user.save
				current_game.update(end_time: Time.now)
				redirect_to :back	
			else
				flash[:notice] = "Stop trying to break my stuff"	
				redirect_to :back
			end
		end
		
	end

end