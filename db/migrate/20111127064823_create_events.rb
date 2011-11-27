class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :event_type, :null => false
      t.string :event_tags
      t.string :event_owner, :null => false
      t.string :created_by, :null => false
      t.datetime :event_time, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
