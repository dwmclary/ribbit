class CreatePeoplePieces < ActiveRecord::Migration
  def self.up
    create_table :people_pieces, :id => false do |t|
      t.integer :person_id
      t.integer :piece_id
    end
  end

  def self.down
    drop_table :people_pieces
  end
end
