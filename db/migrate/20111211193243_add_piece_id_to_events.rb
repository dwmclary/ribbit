class AddPieceIdToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.integer :piece_id
    end
  end

  def self.down
    change_table :events do |t|
      t.remove :piece_id
    end
  end
end
