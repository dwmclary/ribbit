class AddPasswordToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :password
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :password
    end
  end
end
