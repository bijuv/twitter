class AddUsernameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :user, :string
  end

  def self.down
    remove_column :users, :user
  end
end
