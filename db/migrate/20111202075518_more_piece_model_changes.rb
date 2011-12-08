class MorePieceModelChanges < ActiveRecord::Migration
  def self.up
    change_table :pieces do |t|
      t.remove :artist_first_name
      t.remove :artist_last_name
      t.string :artist
      t.remove :created_at
      t.string :creation_date
      t.string :accession_date
      t.string :loan_date
      t.string :artist_birthplace
      t.string :tags
      t.string :packed_with
      t.string :packed_in
    end
  end

  def self.down
    t.string :artist_first_name
    t.string :artist_last_name
    t.remove :artist
    t.date :created_at
    t.remove :creation_date
    t.remove :accession_date
    t.remove :loan_date
    t.remove :artist_birthplace
    t.remove :tags
    t.remove :packed_with
    t.remove :packed_in
  end
end
