class AddChosenWordsToGames < ActiveRecord::Migration
  def change
  	add_column :games, :word1, :string
    add_column :games, :word2, :string
  end
end
