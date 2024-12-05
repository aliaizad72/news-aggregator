class ChangeTimeToDateTimeArticle < ActiveRecord::Migration[8.0]
  def change
    remove_column :articles, :published_date
    add_column :articles, :published_date, :datetime
  end
end
