class AddGuessesToGame < ActiveRecord::Migration
  def change
  	add_column :games, :p1guesses, :string
  	add_column :games, :p2guesses, :string
  end
end
