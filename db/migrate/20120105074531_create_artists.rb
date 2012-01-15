class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string :name, :null => false
      t.string :gender
      t.string :birthplace
      t.string :born
      t.string :died
      t.text :biography
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size  
      t.datetime :photo_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
