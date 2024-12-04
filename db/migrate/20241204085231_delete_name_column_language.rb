class DeleteNameColumnLanguage < ActiveRecord::Migration[8.0]
  def change
    remove_column :languages, :name
  end
end
