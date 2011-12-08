class UpdatePieceAttributes < ActiveRecord::Migration
  def self.up
    change_table :pieces do |t|
      t.remove :artist
      t.string :artist_first_name
      t.string :artist_last_name
      t.string :artist_gender
      t.string :classification
      t.string :medium
      t.string :framed_dimension
      t.string :packed_dimension
      t.string :condition_notes
      t.string :location
      t.string :hanging_hardware
      t.string :handling_instructions
    end
  end

  def self.down
    change_table :pieces do |t|
      t.remove :artist_first_name
      t.remove :artist_last_name
      t.remove :artist_gender
      t.remove :classification
      t.remove :medium
      t.remove :framed_dimension
      t.remove :packed_dimension
      t.remove :condition_notes
      t.remove :location
      t.remove :hanging_hardware
      t.remove :handling_instructions
      t.string :artist
    end
  end
end
