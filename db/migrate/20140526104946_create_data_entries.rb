class CreateDataEntries < ActiveRecord::Migration
  def change
    create_table :data_entries do |t|
      t.integer :node_id
      t.integer :role_id
      t.string  :type
      t.string  :name
      t.string  :loaction
      t.integer :rank
      t.boolean :multi
      t.boolean :mustfill
      t.timestamps
    end
  end
end
