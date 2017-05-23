class GuessesController < ApplicationController

	def create 
		Guess.new(user: current_user, game: current_game, minutes: params[:guess][:minutes] )
	end

#Guess.new(user: User.first, game: Game.first, minutes: 10)
end
