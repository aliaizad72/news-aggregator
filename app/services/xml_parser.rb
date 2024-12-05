require "simple-rss"
require "cgi"
require "nokogiri"

class XmlParser
  def initialize(rss_url)
    @url = rss_url
  end

  def parse
    fetcher = Fetcher.new
    @response = fetcher.fetch(@url)

    if fetcher.response_xml?(@response)
      if fetcher.rss?(@response)
        parse_rss(@response)
      elsif fetcher.atom?(@response)
        parse_atom(@response)
      end
    else
      # if have time can set up some html scraper or something
      @response
    end
  end

  def parse_rss(xml)
    parsed = SimpleRSS.parse(xml)
    parsed.items.map do |item|
      {
        title: CGI.unescapeHTML(item[:title]),
        article_link: item[:link],
        image_link: item[:media_thumbnail_url] || item[:media_content_url],
        guid: item[:guid],
        published_date: String(item[:pubDate])
      }
    end
  end

  def parse_atom(xml)
    parsed = SimpleRSS.parse(xml)
    base_url = parsed.link
    parsed.entries.map do |item|
      {
        title: CGI.unescapeHTML(item[:title]),
        article_link: parsed.link + item[:link],
        image_link: parse_url_from_content(CGI.unescapeHTML(item[:content])),
        guid: item[:guid] || item[:published],
        published_date: String(item[:published])
      }
    end
  end

  def parse_url_from_content(content)
    Nokogiri::HTML.parse(content).at_css("img").attributes["src"].value
  end
end
