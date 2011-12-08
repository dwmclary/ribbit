class CreateExhibitsPiecesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :exhibits_pieces, :id => false do |t|
      t.integer :exhibit_id
      t.integer :piece_id
    end
  end

  def self.down
    drop_table :exhibits_pieces
  end
end
