class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name, :null => false
      t.string :affiliation
      t.text :details
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
