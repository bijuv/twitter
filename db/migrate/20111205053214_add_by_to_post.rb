class AddByToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :by, :integer
    add_column :posts, :to, :integer
  end

  def self.down
    remove_column :posts, :by
    remove_column :posts, :by
  end
end
