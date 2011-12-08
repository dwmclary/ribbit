class CreateGalleryImages < ActiveRecord::Migration
  def self.up
    create_table :gallery_images do |t|
      t.integer :gallery_id
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size  
      t.datetime :photo_updated_at
      t.string :tags
      t.timestamps
    end
  end

  def self.down
    drop_table :gallery_images
  end
end
