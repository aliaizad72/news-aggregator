class RemoveLanguagesId < ActiveRecord::Migration[8.0]
  def change
    remove_column :publishers, :languages_id
    add_reference :publishers, :categories, foreign_key: true
  end
end
