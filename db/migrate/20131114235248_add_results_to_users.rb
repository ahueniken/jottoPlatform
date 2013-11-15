class AddResultsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :wins, :int
  	add_column :users, :losses, :int
  	add_column :users, :ties, :int
  end
end
