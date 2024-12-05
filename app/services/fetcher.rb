require 'open-uri'
class Fetcher
  def fetch(url)
    begin
     URI.open(url)
    rescue OpenURI::HTTPError => e
      e
    rescue SocketError => e
      e
    rescue StandardError => e
      e
    end
  end

  def response_xml?(response)
    valid_content_types = %w[application/rss+xml application/atom+xml application/xml text/xml]
    valid_content_types.include?(content_type(response))
  end

  def content_type(response)
    response.meta["content-type"]&.split("; ")&.first
  end

  def atom?(response)
    content_type(response) == "application/atom+xml"
  end

  def rss?(response)
    content_type(response) == "application/rss+xml"
  end
end
