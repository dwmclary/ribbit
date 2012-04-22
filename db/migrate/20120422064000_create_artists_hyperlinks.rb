class CreateArtistsHyperlinks < ActiveRecord::Migration
  def self.up
    create_table :artists_hyperlinks, :id => false do |t|
      t.integer :hyperlink_id
      t.integer :artist_id
    end
    
  end

  def self.down
    drop_table :artists_hyperlinks
  end
end
