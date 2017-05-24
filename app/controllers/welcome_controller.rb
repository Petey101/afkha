class WelcomeController < ApplicationController

	def index
		@users = User.all
		@games = Game.all
		@guesses = Guess.all
		@guess =  Guess.new

		if current_user 
			@user = current_user
		else
			@user = User.new
		end

		if current_game 
			@elapsed_time = ((Time.now - current_game.created_at) / 60).round(1)
			@last_game_length = ((Game.all[-2].end_time - Game.all[-2].created_at)/60).round(1)
		else
			@last_game_length = ((Game.last.end_time - Game.last.created_at)/60).round(1)
		end
		
		if current_user && current_game
			@guessed = Guess.find_by(user: current_user, game: current_game)
		end
  	end

end
