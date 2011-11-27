class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, :null => false
      t.string :name, :null => false
      t.string :role, :null => false
      t.boolean :is_admin, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
