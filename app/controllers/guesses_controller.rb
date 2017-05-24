class GuessesController < ApplicationController

	def create 
		 guess = Guess.new(user: current_user, game: current_game, minutes: params[:guess][:minutes] )
		 if guess.save
		 	redirect_to :back
		 else 
		 	flash[:notice] = "Someone else already guessed that"
			redirect_to :back
		end
	end
	
end
