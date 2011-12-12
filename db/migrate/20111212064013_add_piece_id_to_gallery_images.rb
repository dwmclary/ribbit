class AddPieceIdToGalleryImages < ActiveRecord::Migration
  def self.up
    change_table :gallery_images do |t|
      t.integer :piece_id
    end
  end

  def self.down
    change_table :gallery_images do |t|
      t.remove :piece_id
    end
  end
end
