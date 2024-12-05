require "test_helper"

class XmlParserTest < ActiveSupport::TestCase
  test "parse_rss for hmetro" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/hmetro_test.xml")
    parsed = parser.parse_rss(test_xml.read)
    hash = { title: "The Cops tak patah semangat", article_link: "https://www.hmetro.com.my/arena/bola-sepak/2024/12/1163060/cops-tak-patah-semangat", image_link: "https://assets.hmetro.com.my/images/articles/spo-xpddrmm_HMfield_image_listing_featured_v2.var_1733394701.jpg", guid: "1163060", published_date: "2024-12-05 18:31:54 +0000" }
    assert_equal parsed.first, hash
  end

  test "parse_rss for says" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/says_test.xml")
    hash = { title: "11 Event Menarik Untuk Anda Kunjungi & Enjoy Bulan Ini, Jom Check It Out!", article_link: "https://says.com/my/seismik/11-event-menarik-untuk-anda-kunjungi-enjoy-bulan-ini-jom-check-it-out", image_link: "https://images.says.com/uploads/story/cover_image/72899/thumb_a0b5.jpeg", guid: "72899", published_date: "2024-12-05 17:57:48 +0800" }
    parsed = parser.parse_rss(test_xml.read)
    assert_equal parsed.first, hash
  end

  test "parse_xml for eatdrinkkl" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/eatdrinkkl_test.xml")
    hash = { title: "Corus KLCC: Celebrate the Christmas & New Year's festive season with buffet feasts", article_link: "https://www.eatdrinkkl.com/posts/featured/corus-klcc-celebrate-the-christmas-new-year-s-festive-season-with-buffet-feasts", image_link: "https://images.eatdrinkkl.com/store/postimage/59489/image/webp_version-7a0cb4e45deb10da5e6d8b89a0f5d19c.webp", guid: "tag:www.eatdrinkkl.com,2005:Post/7908", published_date: "2024-12-05 18:55:00 +0800" }
    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for bangsarbabe" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/bangsarbabe_test.xml")
    hash = { title: "Wong Seng Kitchen, Taman Desa", article_link: "https://www.bangsarbabe.com/2024/12/wong-seng-kitchen-taman-desa.html", image_link: "https://live.staticflickr.com/65535/54184707315_cf458aa158_o.jpg", guid: "https://www.bangsarbabe.com/?p=21372", published_date: "2024-12-05 05:44:59 UTC" }
    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for fmt/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/fmt_test.xml")
    hash = { title: "Lack of alternative plan will hinder LTAT's transformation, says PAC", article_link: "https://www.freemalaysiatoday.com/category/nation/2024/12/05/lack-of-alternative-plan-will-hinder-ltats-transformation-says-pac/", image_link: nil, guid: "https://www.freemalaysiatoday.com/category/nation/2024/12/05/lack-of-alternative-plan-will-hinder-ltats-transformation-says-pac/", published_date: "2024-12-05 13:43:47 UTC" }
    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for trp/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/trp_test.xml")
    hash = { title: "Malaysia’s Potential Role As Hamas Haven Raises Strategic Questions", article_link: "https://www.therakyatpost.com/news/malaysia/2024/12/05/malaysias-potential-role-as-hamas-haven-raises-strategic-questions/", image_link: nil, guid: "https://www.therakyatpost.com/?p=931927", published_date: "2024-12-05 09:23:21 UTC" }

    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for tbp/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/tbp_test.xml")
    hash = { title: "Borneo artist spotlights sustainability in Kenyalang Circus exhibition in KL", article_link: "https://www.theborneopost.com/2024/12/05/borneo-artist-spotlights-sustainability-in-kenyalang-circus-exhibition-in-kl/", image_link: "https://www.theborneopost.com/newsimages/2024/12/FW1438942_KL44_05122024_BALAI_SENI-lpr.jpg", guid: "https://www.theborneopost.com/?p=1225340", published_date: "2024-12-05 14:05:42 UTC" }

    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for mt/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/mt_test.xml")
    hash = { title: "Najib’s Affidavit: A Royal Script of Redemption or Political Theatre?", article_link: "https://www.malaysia-today.net/2024/12/05/najibs-affidavit-a-royal-script-of-redemption-or-political-theatre/", image_link: "https://www.malaysia-today.net/wp-content/uploads/2024/12/BHMOHONDENDUM_BHfield_image_socialmedia-425x250.webp", guid: "https://www.malaysia-today.net/?p=242688", published_date: "2024-12-05 08:28:52 UTC" }
    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for cilisos/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/cilisos_test.xml")
    hash = { title: "The legendary Prosperity Burger makes a return to McDonald’s Malaysia", article_link: "https://cilisos.my/legendary-prosperity-burger-returns-mcdonalds-malaysia/", image_link: "https://cilisos.my/wp-content/uploads/2024/12/Prosperity-Burger-250x140.jpg", guid: "https://cilisos.my/?p=165508", published_date: "2024-12-03 13:54:56 UTC" }

    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for tmr/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/tmr_test.xml")
    hash = { title: "Nova Scotia becomes first province to publicly reimburse JEMPERLI for the treatment of patients with advanced or recurrent dMMR/MSI-H endometrial cancer", article_link: "https://themalaysianreserve.com/2024/12/05/nova-scotia-becomes-first-province-to-publicly-reimburse-jemperli-for-the-treatment-of-patients-with-advanced-or-recurrent-dmmr-msi-h-endometrial-cancer/", image_link: "https://mma.prnewswire.com/media/2574443/GlaxoSmithKline_Inc__Nova_Scotia_becomes_first_province_to_publi.jpg", guid: "https://themalaysianreserve.com/2024/12/05/nova-scotia-becomes-first-province-to-publicly-reimburse-jemperli-for-the-treatment-of-patients-with-advanced-or-recurrent-dmmr-msi-h-endometrial-cancer/", published_date: "2024-12-05 14:43:00 UTC" }
    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for wob/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/wob_test.xml")
    hash = { title: "“A Big Thank You to M’sians!” Access Up to 17 Channels, Box Upgrades & More Await All Astro Customers", article_link: "https://worldofbuzz.com/a-big-thank-you-to-msians-access-up-to-17-channels-box-upgrades-more-await-all-astro-customers/?utm_source=rss&#038;utm_medium=rss&#038;utm_campaign=a-big-thank-you-to-msians-access-up-to-17-channels-box-upgrades-more-await-all-astro-customers", image_link: "https://worldofbuzz.com/wp-content/uploads/2024/12/ENG-KV-Astros-Big-Thank-You.jpg", guid: "https://worldofbuzz.com/?p=703975", published_date: "2024-12-05 13:20:38 UTC" }

    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for soya/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/soya_test.xml")
    hash = { title: "iQoo 13 Malaysia: Snapdragon 8 Elite, 144Hz 2K display and 6,150mAh battery, priced from RM3,499", article_link: "https://soyacincau.com/2024/12/05/iqoo-13-malaysia-launch-price-specs/", image_link: "https://soyacincau.com/wp-content/uploads/2024/12/241205-iqoo-13-malaysia-launch-02-1024x576.jpg", guid: "https://soyacincau.com/?p=408676", published_date: "2024-12-05 09:23:01 UTC" }

    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for india/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/india_test.xml")
    hash = { title: "PAK vs ZIM: Pakistan is unable to win even against Zimbabwe, dreams of winning the Champions Trophy | WATCH", article_link: "https://www.india.com/sports/pak-vs-zim-pakistan-is-unable-to-win-even-against-zimbabwe-dreams-of-winning-the-champions-trophy-watch-7444614/", image_link: nil, guid: "https://www.india.com/?p=7444614", published_date: "2024-12-05 16:24:38 UTC" }

    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for nypost/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/nypost_test.xml")
    hash = { title: "Doctor says common Christmas decoration should be ‘outlawed’ for injuring children", article_link: "https://nypost.com/2024/12/05/lifestyle/doctor-says-common-christmas-decoration-should-be-outlawed-for-injuring-children/", image_link: nil, guid: "https://nypost.com/?post_type=article&#038;p=34017075", published_date: "2024-12-05 16:50:51 UTC" }

    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for bi/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/bi_test.xml")
    hash = { title: "Vox Media is laying off staff as part of a reorg. Here's the memo outlining the changes.", article_link: "https://www.businessinsider.com/vox-media-lays-off-staff-at-lifestyle-brands-thrillist-eater-2024-12", image_link: "https://i.insider.com/55fb05c869bedd3e590a63da?format=jpeg", guid: "https://www.businessinsider.com/vox-media-lays-off-staff-at-lifestyle-brands-thrillist-eater-2024-12", published_date: "2024-12-05 16:40:58 UTC" }
    assert_equal parser.parse_atom(test_xml).first, hash
  end

  test "parse_xml for thesun/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/thesun_test.xml")
    hash = { title: "Major retailer drops brand-new £30 Sol de Janeiro travel set just in time for Christmas", article_link: "https://www.thesun.co.uk/fabulous/32126269/sol-je-janeiro-delicia-drench-travel-set/", image_link: "https://www.thesun.co.uk/wp-content/uploads/2024/12/sol-de-janeiro-set-z_a8fa8f.jpg?strip=all", guid: "Post 32126269 at The Sun", published_date: "2024-12-05 16:59:36 UTC" }

    assert_equal parser.parse_atom(test_xml).first, hash
  end
end
