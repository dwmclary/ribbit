class CreateExhibits < ActiveRecord::Migration
  def self.up
    create_table :exhibits do |t|
      t.string :name
      t.date :opening_date
      t.date :closing_date
      t.string :curator
      t.timestamps
    end
  end

  def self.down
    drop_table :exhibits
  end
end
