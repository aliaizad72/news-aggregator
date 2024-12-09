class ChangeColumnNames < ActiveRecord::Migration[8.0]
  def change
    rename_column :publishers, :one_category?, :one_category
    rename_column :publishers, :bilingual?, :bilingual
  end
end
