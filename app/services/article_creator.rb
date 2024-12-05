require "open-uri"
require "simple-rss"

class ArticleCreator
  def initialize(publisher)
    @publisher = publisher
    @rss_url = @publisher.rss_url
    @default_language = @publisher.language
    @default_category = @publisher.default_category
  end
end
