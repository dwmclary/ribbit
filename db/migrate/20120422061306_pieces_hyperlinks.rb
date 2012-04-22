class PiecesHyperlinks < ActiveRecord::Migration
  def self.up
    create_table :hyperlinks_pieces, :id => false do |t|
      t.integer :hyperlink_id
      t.integer :piece_id
    end
  end

  def self.down
    drop_table :hyperlinks_pieces
  end
end
