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
      parse_xml(@response)
    else
      # if have time can set up some html scraper or something
      @response
    end
  end

  def parse_xml(xml)
    parsed = SimpleRSS.parse(xml)
    feeds = parsed.items || parsed.entries
    feeds.map do |item|
      {
        title: parse_title(item[:title]),
        article_link: parse_article_link(parsed.link, item[:link]),
        image_link: parse_image_url(item),
        guid: item[:guid] || item[:id],
        published_date: String(item[:pubDate] || item[:published] || item[:updated]),
        description: parse_description(item)
      }
    end
  end

  def parse_description(item)
    content = item[:description] || item[:summary] || item[:content]

    return item[:title] if content.nil?

    content = CGI.unescapeHTML(content)
    parsed = Nokogiri::HTML.parse(content).text.gsub("\n", "")
    parsed_words = parsed.split(" ")

    if parsed_words.length > 25
      parsed_words[0..26].join(" ")
    else
      parse_title(item[:title]) + ". " + parsed
    end
  end

  def parse_title(title)
    title = title.force_encoding("UTF-8")
    CGI.unescapeHTML(title).gsub("â€™", "'").gsub("&mdash;", "-")
  end

  def parse_article_link(base_url, path)
    unless URI.regexp.match?(path)
      return base_url + path
    end

    path
  end

  def parse_image_url(item)
    # wordprsss emoji, the malysian insider, the guardian
    ignore_image_urls = %w[https://s.w.org/images/core/emoji https://mediatmi.b-cdn.net/resources/stories_images/303038/yourinsight2020-signpost.jpg https://i.guim.co.uk/img/media/]
    image_content_types = %w[image/png image/jpg image/webp image/jpeg image/svg image/bmp]
    image_format_regex =  /(.*)(?=\.(jpeg|jpg|png|webp|svg|bmp))/

    # first priority
    image_url = item[:media_thumbnail_url]

    # second priority
    if image_url.nil? && image_content_types.include?(item[:media_content_types]) || image_format_regex.match?(item[:media_content_url])
      image_url = item[:media_content_url]
    end

    if image_url.nil?
      # third priority
      content = item[:content_encoded] || item[:description] || item[:content] || item[:summary]

      return nil if content.nil?

      content = CGI.unescapeHTML(content)

      image_tag = Nokogiri::HTML.parse(content).at_css("img")
      if image_tag
        image_url = image_tag.attributes["src"].value
      end
    end

    if image_url.nil? || ignore_image_urls.any? { |url| image_url.include?(url) }
      nil
    else
      image_url
    end
  end
end
