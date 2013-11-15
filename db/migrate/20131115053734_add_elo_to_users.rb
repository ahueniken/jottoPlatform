class AddEloToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :elo, :int
  end
end
