class AddSearchableArtistNameToPiece < ActiveRecord::Migration
  def self.up
    add_column :pieces, :artist_name, :string
  end

  def self.down
    remove_column :pieces, :artist_name
  end
end
