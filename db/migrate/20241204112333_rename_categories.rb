class RenameCategories < ActiveRecord::Migration[8.0]
  def change
    remove_reference :publishers, :categories

    add_reference :publishers, :category, foreign_key: true
  end
end
