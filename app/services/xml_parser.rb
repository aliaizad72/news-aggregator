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
    parsed.entries.map do |item|
      {
        title: parse_title(item[:title]),
        article_link: parse_article_link(parsed.link, item[:link]),
        image_link: parse_url_from_content(CGI.unescapeHTML(item[:content] || item[:summary])),
        guid: item[:guid] || item[:id],
        published_date: String(item[:published] || item[:updated])
      }
    end
  end

  def parse_title(title)
    CGI.unescapeHTML(title).gsub("â€™", "'")
  end
  def parse_article_link(base_url, path)
    unless URI.regexp.match?(path)
      return base_url + path
    end

    path
  end

  def parse_url_from_content(content)
    wordpress_emoji_regex =  /^https:\/\/s\.w\.org\/images\/core\/emoji\/.*/
    image_tag = Nokogiri::HTML.parse(content).at_css("img")
    if image_tag
      url = image_tag.attributes["src"].value
      if wordpress_emoji_regex.match?(url)
        nil
      else
        url
      end
    end
  end
end
