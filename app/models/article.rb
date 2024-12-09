class Article < ApplicationRecord
  after_create :delete_after_2_days

  belongs_to :publisher
  belongs_to :language
  belongs_to :category

  default_scope { order(published_date: :desc) }

  validates :title, presence: true
  validates :published_date, presence: true
  validates :article_link, presence: true, format: { with: URI.regexp(%w[http https]), message: "Only allow links with http/https" }
  validates :guid, presence: true, uniqueness: { scope: :publisher_id }

  private

  def delete_after_2_days
    DestroyArticlesJob.perform_in(2.days, id)
  end
end
