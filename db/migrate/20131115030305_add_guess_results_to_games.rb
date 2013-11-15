class AddGuessResultsToGames < ActiveRecord::Migration
  def change
  	add_column :games, :p1GuessResults, :text
  	add_column :games, :p2GuessResults, :text
  end
end
