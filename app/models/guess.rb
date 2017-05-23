class Guess < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	validates_uniqueness_of :user_id, :scope => :game_id
	validates_uniqueness_of :minutes, :scope => :game_id
	validates :minutes, :numericality => { :greater_than_or_equal_to => 0 }

end
