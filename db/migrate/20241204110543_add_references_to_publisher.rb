class AddReferencesToPublisher < ActiveRecord::Migration[8.0]
  def change
    add_reference :publishers, :languages, foreign_key: true
  end
end