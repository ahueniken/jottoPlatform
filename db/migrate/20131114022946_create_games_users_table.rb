class CreateGamesUsersTable < ActiveRecord::Migration
  def self.up
    create_table :games_users, :id => false do |t|
        t.references :game
        t.references :user
    end
    add_index :games_users, [:game_id, :user_id]
    add_index :games_users, :user_id
  end

  def self.down
    drop_table :games_users
  end
end
