class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :entry_ip
      t.boolean :banned, default: false
      t.integer :entry_counter, default: 1

      t.timestamps null: false
    end
  end
end
