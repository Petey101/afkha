class WelcomeController < ApplicationController

	def index
		@users = User.all
		@games = Game.all
		@guesses = Guess.all
		if current_user 
			@user = current_user
		else
			@user = User.new
		end
		if current_game 
			@elapsed_time = ((Time.now - current_game.created_at) / 60).round(1)
		end
  	end

end
