class RemoveArtistInformationFromPiece < ActiveRecord::Migration
  def self.up
    change_table :pieces do |t|
      t.integer :artist_id
      t.remove :artist_birthplace
      t.remove :artist_gender
    end
  end

  def self.down
    change_table :pieces do |t|
      t.remove :artist_id
      t.string :artist_birthplace
      t.string :artist_gender
    end
  end
end
