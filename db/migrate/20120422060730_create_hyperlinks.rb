class CreateHyperlinks < ActiveRecord::Migration
  def self.up
    create_table :hyperlinks do |t|
      t.string :link_text, :null => false
      t.integer :user_id, :null => false
      t.integer :piece_id
      t.integer :artist_id
      t.timestamps
    end
  end

  def self.down
    drop_table :hyperlinks
  end
end
