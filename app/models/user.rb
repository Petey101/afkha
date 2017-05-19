class User < ActiveRecord::Base
	has_many :guesses
	validates :name, uniqueness: true
end
