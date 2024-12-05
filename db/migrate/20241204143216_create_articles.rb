class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.references :publisher, null: false, foreign_key: true
      t.text :title
      t.time :published_date
      t.string :article_link
      t.string :image_link
      t.references :language, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :guid

      t.timestamps
    end

    add_index :articles, [ :publisher_id, :guid ]
  end
end
