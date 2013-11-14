class AddWinnerToGames < ActiveRecord::Migration
  def change
  	add_column :games, :winner, :int
  end
end
