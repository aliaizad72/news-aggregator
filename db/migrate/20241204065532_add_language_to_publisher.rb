class AddLanguageToPublisher < ActiveRecord::Migration[8.0]
  def change
    add_reference :publishers, :language
  end
end
