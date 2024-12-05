require "test_helper"

class XmlParserTest < ActiveSupport::TestCase
  test "parse_rss for hmetro" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/hmetro_test.xml")
    parsed = parser.parse_rss(test_xml.read)
    hash = { title: "The Cops tak patah semangat", article_link: "https://www.hmetro.com.my/arena/bola-sepak/2024/12/1163060/cops-tak-patah-semangat", image_link: "https://assets.hmetro.com.my/images/articles/spo-xpddrmm_HMfield_image_listing_featured_v2.var_1733394701.jpg", guid: "1163060", published_date: "2024-12-05 18:31:54 +0000" }
    assert_equal parsed.first, hash
  end

  test "parse_rss for says" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/says_test.xml")
    hash = { title: "11 Event Menarik Untuk Anda Kunjungi & Enjoy Bulan Ini, Jom Check It Out!", article_link: "https://says.com/my/seismik/11-event-menarik-untuk-anda-kunjungi-enjoy-bulan-ini-jom-check-it-out", image_link: "https://images.says.com/uploads/story/cover_image/72899/thumb_a0b5.jpeg", guid: "72899", published_date: "2024-12-05 17:57:48 +0800" }
    parsed = parser.parse_rss(test_xml.read)
    assert_equal parsed.first, hash
  end

  test "parse_xml for eatdrinkkl" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/eatdrinkkl_test.xml")
    puts parser.parse_atom(test_xml)
  end
end