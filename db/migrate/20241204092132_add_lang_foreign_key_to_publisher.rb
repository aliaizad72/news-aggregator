class AddLangForeignKeyToPublisher < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :publishers, :languages, column: :language_id
  end
end
