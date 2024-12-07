class Publisher < ApplicationRecord
  after_create :create_articles

  belongs_to :default_category, class_name: "Category", foreign_key: :category_id, optional: true
  belongs_to :language
  has_many :articles

  validate :rss_url_must_return_xml

  validates :name, presence: true
  validates :rss_url, presence: true, format: { with: URI.regexp(%w[http https]), message: "Only allow links with http/https" }

  private

  def create_articles
    ArticleCreator.new(self).create
    p "#{Article.count} created"
  end

  def rss_url_must_return_xml
    fetcher = Fetcher.new
    response = fetcher.fetch(rss_url)

    if response.kind_of?(Exception)
      if response.instance_of?(OpenURI::HTTPError)
        errors.add :rss_url, :http_error, message: "HTTP error occurred: #{response.message}"
      elsif response.kind_of?(SocketError)
        errors.add :rss_url, :connection_error, message: "Could not connect to the URL"
      else
        errors.add :rss_url, :standard_error, message: "An error occurred: #{response.message}"
      end
    else
      unless fetcher.response_xml?(response)
        errors.add :rss_url, :not_xml, message: "URL must return a valid XML feed (RSS/Atom)"
      end
    end
  end
end
