class AddPhotoColumnsToPiece < ActiveRecord::Migration
  def self.up
    add_column :pieces, :photo_file_name,    :string
    add_column :pieces, :photo_content_type, :string
    add_column :pieces, :photo_file_size,    :integer
    add_column :pieces, :photo_updated_at,   :datetime
  end

  def self.down
    remove_column :pieces, :photo_file_name
    remove_column :pieces, :photo_content_type
    remove_column :pieces, :photo_file_size
    remove_column :pieces, :photo_updated_at
  end
end
