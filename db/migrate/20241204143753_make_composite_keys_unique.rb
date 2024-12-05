class MakeCompositeKeysUnique < ActiveRecord::Migration[8.0]
  def change
    remove_index :articles, [:publisher_id, :guid]
    add_index :articles, [:publisher_id, :guid], unique: true
  end
end
