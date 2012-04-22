class AddUserIdToPiece < ActiveRecord::Migration
  def self.up
    add_column :pieces, :user_id, :integer, :null => false
  end

  def self.down
    remove_column :pieces, :user_id
  end
end
