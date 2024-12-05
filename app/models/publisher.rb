require "open-uri"
class Publisher < ApplicationRecord
  belongs_to :default_category, class_name: "Category", foreign_key: :category_id, optional: true
  belongs_to :language
  has_many :articles

  validate :rss_url_must_return_xml

  validates :name, presence: true
  validates :rss_url, presence: true, format: { with: URI.regexp(%w[http https]), message: "Only allow links with http/https" }

  private

  def rss_url_must_return_xml
    begin
      response = URI.open(rss_url)
      content_type = response.meta["content-type"]&.split("; ")&.first
      valid_content_types = %w[application/rss+xml application/atom+xml application/xml text/xml]
      unless valid_content_types.include?(content_type)
        errors.add :rss_url, :not_xml, message: "URL must return a valid XML feed (RSS/Atom)"
      end
    rescue OpenURI::HTTPError => e
      errors.add :rss_url, :http_error, message: "HTTP error occurred: #{e.message}"
    rescue SocketError
      errors.add :rss_url, :connection_error, message: "Could not connect to the URL"
    rescue StandardError => e
      errors.add :rss_url, :standard_error, message: "An error occurred: #{e.message}"
    end
  end
end
