class Game < ActiveRecord::Base
  attr_accessible :user1, :user2, :word1, :word2, :p1guesses, :p2guesses


end