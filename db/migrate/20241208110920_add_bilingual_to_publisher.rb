class AddBilingualToPublisher < ActiveRecord::Migration[8.0]
  def change
    add_column :publishers, :bilingual?, :boolean
  end
end
