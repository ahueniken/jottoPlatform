class AddUserstoGames < ActiveRecord::Migration
  def change
    add_column :games, :user1, :int
    add_column :games, :user2, :int
  end
end
