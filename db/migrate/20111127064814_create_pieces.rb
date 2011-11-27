class CreatePieces < ActiveRecord::Migration
  def self.up
    create_table :pieces do |t|
      t.string :accession, :null => false
      t.string :title, :null => false
      t.string :dimensions
      t.string :artist, :null => false
      t.date :created_at
      t.boolean :outgoing_loan, :default => false
      t.boolean :incoming_loan, :default => false
      t.string :owner
      t.timestamps
    end
  end

  def self.down
    drop_table :pieces
  end
end
