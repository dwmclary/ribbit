class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.integer :piece_id
      t.string :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
