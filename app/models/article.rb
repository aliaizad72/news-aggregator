class Article < ApplicationRecord
  belongs_to :publisher
  belongs_to :language
  belongs_to :category

  validates :title, presence: true
  validates :published_date, presence: true
  validates :article_link, presence: true, format: { with: URI.regexp(%w[http https]), message: "Only allow links with http/https" }
  validates :guid, presence: true, uniqueness: { scope: :publisher_id }
end
