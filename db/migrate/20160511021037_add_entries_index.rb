class AddEntriesIndex < ActiveRecord::Migration
  def change
    add_index :entries, :entry_ip, :unique => true
  end
end
