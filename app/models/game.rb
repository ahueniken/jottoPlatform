class Game < ActiveRecord::Base
  attr_accessible :user1, :user2, :word1, :word2, :p1guesses, :p2guesses, :winner
  has_and_belongs_to_many :users
end
