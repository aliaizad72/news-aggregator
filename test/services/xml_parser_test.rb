require "test_helper"

class XmlParserTest < ActiveSupport::TestCase
  test "parse_xml for hmetro" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/hmetro_test.xml")
    hash = { title: "The Cops tak patah semangat", article_link: "https://www.hmetro.com.my/arena/bola-sepak/2024/12/1163060/cops-tak-patah-semangat", image_link: "https://assets.hmetro.com.my/images/articles/spo-xpddrmm_HMfield_image_listing_featured_v2.var_1733394701.jpg", guid: "1163060", published_date: "2024-12-05 18:31:54 +0000", description: "The Cops tak patah semangat. Georgetown: PDRM FC bertekad mahu menebus kekecewaan selepas tewas pada aksi Liga Super menentang Penang FC dengan keputusan 2-0 di Stadium Bandaraya, malam semalam." }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for says" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/says_test.xml")
    hash = { title: "11 Event Menarik Untuk Anda Kunjungi & Enjoy Bulan Ini, Jom Check It Out!", article_link: "https://says.com/my/seismik/11-event-menarik-untuk-anda-kunjungi-enjoy-bulan-ini-jom-check-it-out", image_link: "https://images.says.com/uploads/story/cover_image/72899/thumb_a0b5.jpeg", guid: "72899", published_date: "2024-12-05 17:57:48 +0800", description: "11 Event Menarik Untuk Anda Kunjungi & Enjoy Bulan Ini, Jom Check It Out!. Jangan lupa ajak kawan-kawan atau keluarga sekali!" }
    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for utusan" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/utusan_test.xml")
    hash = { title: "FDK 2.0 berlangsung meriah, kenali flora, fauna TNJTP", article_link: "https://www.utusan.com.my/nasional/2024/12/fdk-2-0-berlangsung-meriah-kenali-flora-fauna-tnjtp/?utm_source=rss&#038;utm_medium=rss&#038;utm_campaign=fdk-2-0-berlangsung-meriah-kenali-flora-fauna-tnjtp", image_link: "https://www.utusan.com.my/wp-content/uploads/2024/12/DKUKUP-MERIAH-1024x768.jpeg", guid: "https://www.utusan.com.my/?p=1044433", published_date: "2024-12-06 05:42:06 +0000", description: "PONTIAN: Ketenangan Taman Negara Johor Tanjung Piai (TNJTP), dekat sini bertukar riuh-rendah dengan suara kira-kira 150 peserta terdiri daripada pelajar Sekolah Menengah Kebangsaan (SMK) Sri Kukup dan" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for fmt/rss" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/fmt_test.xml")
    hash = { title: "US blocked bid for Roger Ng trial documents, says Najib", article_link: "https://www.freemalaysiatoday.com/category/nation/2024/12/06/us-blocked-bid-for-roger-ng-trial-documents-says-najib/", image_link: "https://media.freemalaysiatoday.com/wp-content/uploads/2024/12/f530b817-najib-razak-1mdb-kl-high-court-5.webp", guid: "https://www.freemalaysiatoday.com/?p=2931569", published_date: "2024-12-06 05:45:00 +0000", description: "US blocked bid for Roger Ng trial documents, says Najib. Najib Razak says he had to face the prosecution in his 1MDB trial with his hands tied as he did not have these crucial documents." }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for tmi/rss" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/tmi_test.xml")
    hash = { title: "Najib might just get his house arrest wish soon", article_link: "https://www.themalaysianinsight.com/s/488327", image_link: nil, guid: "https://www.themalaysianinsight.com/s/488327", published_date: "2024-10-20 08:00:00 +0800", description: "Prime Minister Anwar Ibrahim’s surprise announcement on a proposed new law to allow house arrest in his Budget 2025 speech on Friday has raised eyebrows.At present there" }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for nst" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/nst_test.xml")
    hash = { title: "Time to move on, says outgoing PH chairman Liew", article_link: "https://www.nst.com.my/news/nation/2024/12/1144664/time-move-says-outgoing-ph-chairman-liew", image_link: "https://assets.nst.com.my/images/articles/wtliew612_NSTfield_image_listing_featured_v2.var_1733463455.jpg", guid: "1144664", published_date: "2024-12-06 13:37:38 +0000", description: "KOTA KINABALU: Former Sabah Pakatan Harapan (PH) chairman Datuk Seri Christina Liew has urged party members to stay calm after the change of the coalition’s state leadership." }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for kosmo" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/kosmo_test.xml")
    hash = { title: "Lagi gudang ‘cuti’ diserbu, rampas arak tiruan RM1 juta", article_link: "https://www.kosmo.com.my/2024/12/06/lagi-gudang-cuti-diserbu-rampas-arak-tiruan-rm1-juta/?utm_source=rss&#038;utm_medium=rss&#038;utm_campaign=lagi-gudang-cuti-diserbu-rampas-arak-tiruan-rm1-juta", image_link: "https://www.kosmo.com.my/wp-content/uploads/2024/12/WhatsApp-Image-2024-12-06-at-12.48.44-PM-1024x768.jpeg", guid: "https://www.kosmo.com.my/?p=693377", published_date: "2024-12-06 05:38:50 +0000", description: "SEBERANG PERAI – Tidak sampai enam jam sebuah gudang ‘cuti’ di Permatang Batu di sini digempur, sebuah lagi premis dan kontena di lokasi sama turut diserbu sekali" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for tbp" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/tbp_test.xml")
    hash = { title: "Former rep calls on Sibu Hospital to re-examine move to go totally cashless", article_link: "https://www.theborneopost.com/2024/12/06/former-rep-calls-on-sibu-hospital-to-re-examine-move-to-go-totally-cashless/", image_link: "https://www.theborneopost.com/newsimages/2023/03/sbw-280323-pw-irene-e1679985910712.jpg", guid: "https://www.theborneopost.com/?p=1225384", published_date: "2024-12-06 05:34:02 +0000", description: "SIBU (Dec 6): Former Bukit Assek assemblywoman Irene Chang has urged the Sibu Hospital to reconsider going completely cashless. She said the move to go cashless for" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for tmr" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/tmr_test.xml")
    hash = { title: "Team LZJ confirms Tat Meng’s exit", article_link: "https://themalaysianreserve.com/2024/12/06/team-lzj-confirms-tat-mengs-exit/", image_link: "https://themalaysianreserve.com/wp-content/uploads/2024/12/TEAM-LZJ-Wong-Tat-Meng-1-1024x768.jpg", guid: "https://themalaysianreserve.com/?p=586258", published_date: "2024-12-06 05:26:43 +0000", description: "(Source: INSTAGRAM / teamlzj)KUALA LUMPUR — Lee Zii Jia’s Team LZJ has confirmed that coaching director Wong Tat Meng will be leaving the professional team when his" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for mt" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/mt_test.xml")
    hash = { title: "If Zahid Betrays Anwar, it will be Anwar’s fault more than Zahid", article_link: "https://www.malaysia-today.net/2024/12/06/if-zahid-betrays-anwar-it-will-be-anwars-fault-more-than-zahid/", image_link: "https://www.malaysia-today.net/wp-content/uploads/2023/12/download-2.jpg", guid: "https://www.malaysia-today.net/?p=242713", published_date: "2024-12-06 03:14:42 +0000", description: "If Zahid betrays Anwar, Umno, PN and other opponents of Anwar and PH in Sabah and Sarawak, will likely combine their strength to overthrow Anwar’s reign. Nehru" }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for sarawak_report" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/sarawak_test.xml")
    hash = { title: "Sabah Forestry Admits Log Extraction And Export – Says Timber Is ‘Disease Ridden’!", article_link: "https://www.sarawakreport.org/2024/12/sabah-forestry-admit-timber-extraction-and-export-say-timber-is-disease-ridden/", image_link: "https://sarawakreport.org/wp-content/uploads/imgcache/2024/12/pImg_f8d096b5295525efe4bbdc20ed61693c.jpeg", guid: "https://www.sarawakreport.org/2024/12/sabah-forestry-admit-timber-extraction-and-export-say-timber-is-disease-ridden/", published_date: "2024-12-03 22:08:56 +0000", description: "The Sabah state government has accused Sarawak Report of lying. Except in the same statement it admits Sarawak Report was correct in reporting that logs are being" }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for trp" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/trp_test.xml")
    hash = { title: "The Sweet Symphony: Kenangan Coffee’s Tiramisu Series Elevates Malaysia’s Coffee Culture", article_link: "https://www.therakyatpost.com/living/2024/12/06/the-sweet-symphony-kenangan-coffees-tiramisu-series-elevates-malaysias-coffee-culture/", image_link: "https://www.therakyatpost.com/wp-content/uploads/2024/12/Untitled3.jpg", guid: "https://www.therakyatpost.com/?p=932448", published_date: "2024-12-06 04:59:50 +0000", description: "The Sweet Symphony: Kenangan Coffee’s Tiramisu Series Elevates Malaysia’s Coffee Culture. Kenangan Coffee's newest creation exemplifies the evolving sophistication of Malaysia's coffee culture – where every sip is designed to create a lasting memory." }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for guardian" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/guardian_test.xml")
    hash = { title: "Defiant Macron vows to stay on as French president and will appoint PM within days", article_link: "https://www.theguardian.com/world/2024/dec/05/macron-vows-to-stay-on-as-french-president-and-will-appoint-pm-within-days", image_link: nil, guid: "https://www.theguardian.com/world/2024/dec/05/macron-vows-to-stay-on-as-french-president-and-will-appoint-pm-within-days", published_date: "2024-12-05 19:47:55 +0000", description: "President says he will remain in power until 2027, amid political turmoil following collapse of governmentThe French president, Emmanuel Macron, has ruled out resigning, saying he will" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for fox" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/fox_test.xml")
    hash = { title: "Black Eyed Peas star predicts which jobs may go extinct thanks to AI", article_link: "https://www.foxnews.com/entertainment/black-eyed-peas-star-predicts-which-jobs-may-go-extinct-thanks-ai", image_link: "https://a57.foxnews.com/static.foxnews.com/foxnews.com/content/uploads/2024/12/931/523/will_i_am.jpg?ve=1&amp;tl=1", guid: "https://www.foxnews.com/entertainment/black-eyed-peas-star-predicts-which-jobs-may-go-extinct-thanks-ai", published_date: "2024-12-06 02:00:16 -0500", description: "Black Eyed Peas star will.i.am has predictions about who will thrive and who won't as artificial intelligence begins to be used more and more in the music" }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for dailymail" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/dailymail_test.xml")
    hash = { title: "I'm A Celebrity's Maura Higgins is embraced by Jane Moore after shock elimination as Melvin Odoom LEAPS into Barry McGuigan's arms at the hotel after double exit", article_link: "https://www.dailymail.co.uk/tvshowbiz/article-14164563/Im-Celebrity-Barry-McGuigan-Maura-Higgins-Jane-Melvin-campmates-hotel-double-elimination.html?ns_mchannel=rss&amp;ito=1490&amp;ns_campaign=1490", image_link: "https://i.dailymail.co.uk/1s/2024/12/06/08/92863469-0-image-m-2_1733472875819.jpg", guid: "https://www.dailymail.co.uk/tvshowbiz/article-14164563/Im-Celebrity-Barry-McGuigan-Maura-Higgins-Jane-Melvin-campmates-hotel-double-elimination.html?ns_mchannel=rss&amp;ito=1490&amp;ns_campaign=1490", published_date: "2024-12-06 08:18:53 +0000", description: "I'm A Celebrity's Barry McGuigan and Maura Higgins were given a warm welcome on Thursday as they arrived back at the hotel in Surfers Paradise, Australia following" }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for ndtv" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/ndtv_test.xml")
    hash = { title: "Harrison Ford Gets De-Aged (Again) For Indiana Jones Video Game", article_link: "https://www.ndtv.com/entertainment/harrison-ford-gets-de-aged-again-for-indiana-jones-and-the-dial-of-destiny-video-game-7185167", image_link: nil, guid: "7185167", published_date: "2024-12-06 12:50:39 +0530", description: "Harrison Ford Gets De-Aged (Again) For Indiana Jones Video Game. Set in 1937, it follows Indy from the Vatican to China via Egypt in pursuit of a mysterious power coveted by Nazi spies" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for news18" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/news18_test.xml")
    hash = { title: "Couple Caught During Mile-High Romp Near Plane's Cockpit, Crew Under Fire For Leaking Video", article_link: "https://www.news18.com/world/couple-caught-during-mile-high-romp-near-planes-cockpit-crew-under-fire-for-leaking-video-9147201.html", image_link: "https://images.news18.com/ibnlive/uploads/2024/12/mahaparinirvan-diwas-from-schools-to-banks-know-whats-open-and-closed-in-maharashtra-today-3-2024-12-9a683bea06a3d7fa18ea361337a69a76-3x2.jpg", guid: "https://www.news18.com/world/couple-caught-during-mile-high-romp-near-planes-cockpit-crew-under-fire-for-leaking-video-9147201.html", published_date: "2024-12-06 13:57:12 +0530", description: "Couple Caught During Mile-High Romp Near Plane's Cockpit, Crew Under Fire For Leaking Video. A leaked X-rated clip of the incident, now surfacing on social media, allegedly shows the woman kneeling while performing the act on her partner." }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for nbc" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/nbc_test.xml")
    hash = { title: "As manhunt goes on, new images of person of interest in killing of UnitedHealthcare CEO", article_link: "https://www.nbcnews.com/nightly-news/video/as-manhunt-goes-on-new-images-of-person-of-interest-in-killing-of-unitedhealthcare-ceo-226329669771", image_link: "https://media-cldnry.s-nbcnews.com/image/upload/t_fit_1500w/mpx/2704722219/2024_12/1733449209934_nn_sbr_ceo_shooter_241205_1920x1080-zc0lm6.jpg", guid: "nn_sbr_ceo_shooter_241205", published_date: "2024-12-06 01:40:17 +0000", description: "The manhunt continued in New York for the man wanted in the killing of UnitedHealthcare CEO Brian Thompson. New images emerged of a person of interest, who" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for independent" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/independent_test.xml")
    hash = { title: "Can’t work, sing, travel, study: All the ways the Taliban are restricting lives of women in Afghanistan", article_link: "https://www.independent.co.uk/asia/south-asia/afghanistan-taliban-bans-women-mid-wives-education-work-b2659927.html", image_link: "https://static.independent.co.uk/2024/11/04/10/GettyImages-2167366841.jpg?width=1200&amp;auto=webp", guid: "b2640881", published_date: "2024-12-06 08:34:04 +0000", description: "Afghan women cannot be heard in public, even if it is to offer prayers, and have been banned from schools, workplaces, salons, gyms and national parks under" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for cbs" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/cbs_test.xml")
    hash = { title: "3 climbers from U.S., Canada believed dead in fall from New Zealand's highest peak", article_link: "https://www.cbsnews.com/news/3-climbers-from-u-s-canada-believed-dead-fall-new-zealand-highest-peak-aoraki/", image_link: nil, guid: "96dcb8f9-851c-495c-ad2e-13b64cfb946c", published_date: "2024-12-06 00:08:57 -0500", description: "The men's bodies have not been found. But based on footprints glimpsed in the snow, and items believed to belong to them retrieved from the slopes, the" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for bi/rss" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/bi_test.xml")
    hash = { title: "The South Korean president's party says he needs to go - and that he tried to arrest its leaders during martial law", article_link: "https://www.businessinsider.com/south-korea-president-yoon-suk-yeol-impeachment-own-party-arrest-2024-12", image_link: "https://i.insider.com/67526e048fb3f94e5073c6b4?format=jpeg", guid: "https://www.businessinsider.com/south-korea-president-yoon-suk-yeol-impeachment-own-party-arrest-2024-12", published_date: "2024-12-06 05:21:19 UTC", description: "The South Korean president's party says he needs to go - and that he tried to arrest its leaders during martial law. Yoon already faces an impeachment motion by the main opposition party, which holds a majority in parliament. His party leader now wants him out." }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for rt" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/rt_test.xml")
    hash = { title: "Tulsi Gabbard’s views on Russia shaped by reading RT – ABC News", article_link: "https://www.rt.com/news/608823-tulsi-gabbard-reads-rt/?utm_source=rss&utm_medium=rss&utm_campaign=RSS", image_link: "https://mf.b37mrtl.ru/files/2024.11/thumbnail/6736c67f20302727b40f4fd7.png", guid: "https://www.rt.com/news/608823-tulsi-gabbard-reads-rt/", published_date: "2024-12-06 09:00:53 +0000", description: "Tulsi Gabbard’s views on Russia shaped by reading RT – ABC News.  ABC has pointed to Tulsi Gabbard’s appreciation of the RT website as a sign of a compromised worldview Read Full Article at RT.com" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for telegraph" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/telegraph_test.xml")
    hash = { title: "House prices surge to record high", article_link: "https://www.telegraph.co.uk/business/2024/12/06/ftse-100-markets-latest-news-uk-growth-budget-bitcoin/", image_link: nil, guid: "98ee73fa-4762-3830-9bc1-5c8f1b4a4fbb", published_date: "2024-12-06 08:16:05 +0000", description: "House prices surge to record high. House prices rose to a new record high last month amid rising demand for mortgages and easing borrowing costs, according to a lender." }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for aljazeera" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/aljazeera_test.xml")
    hash = { title: "Trump taps hawkish former Senator David Perdue as ambassador to China", article_link: "https://www.aljazeera.com/news/2024/12/6/trump-taps-hawkish-former-senator-david-perdue-as-ambassador-to-china?traffic_source=rss", image_link: nil, guid: "https://www.aljazeera.com/?t=1733459557", published_date: "2024-12-06 05:48:47 +0000", description: "Trump taps hawkish former Senator David Perdue as ambassador to China. US president-elect says ex-Georgia senator will help maintain a 'productive working relationship with China'." }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for thesun/rss" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/rss/thesun_test.xml")
    hash = { title: "Nighbitch review: This portrayal of a new mother who transforms into a dog at night teeters on the brink of barking mad", article_link: "https://www.thesun.co.uk/tv/32147388/nighbitch-film-review-mother-transforms-into-dog/", image_link: "https://www.thesun.co.uk/wp-content/uploads/2024/12/image-released-searchlight-pictures-shows-953958587.jpg?strip=all&w=960", guid: "Post 32147388 at The Sun", published_date: "2024-12-06 02:23:06 +0000", description: "Nighbitch review: This portrayal of a new mother who transforms into a dog at night teeters on the brink of barking mad. " }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  # END OF RSS TESTS
  ###############################################################################################################################

  test "parse_xml for eatdrinkkl" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/eatdrinkkl_test.xml")
    hash = { title: "Corus KLCC: Celebrate the Christmas & New Year's festive season with buffet feasts", article_link: "https://www.eatdrinkkl.com/posts/featured/corus-klcc-celebrate-the-christmas-new-year-s-festive-season-with-buffet-feasts", image_link: "https://images.eatdrinkkl.com/store/postimage/59489/image/webp_version-7a0cb4e45deb10da5e6d8b89a0f5d19c.webp", guid: "tag:www.eatdrinkkl.com,2005:Post/7908", published_date: "2024-12-05 18:55:00 +0800", description: "Celebrate Christmas and New Year in style with buffet feasts that feature fabulous holiday dishes at Corus KLCC! Seasonal specials seize the spotlight for the Christmas Eve" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for bangsarbabe" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/bangsarbabe_test.xml")
    hash = { title: "Wong Seng Kitchen, Taman Desa", article_link: "https://www.bangsarbabe.com/2024/12/wong-seng-kitchen-taman-desa.html", image_link: "https://live.staticflickr.com/65535/54184707315_cf458aa158_o.jpg", guid: "https://www.bangsarbabe.com/?p=21372", published_date: "2024-12-05 05:44:59 UTC", description: "Wong Seng Kitchen, Taman Desa. Wong Seng Kitchen in Taman Desa has been around for quite some time, but Jien and I only recently checked them out after walking past…" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for fmt/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/fmt_test.xml")
    hash = { title: "Lack of alternative plan will hinder LTAT's transformation, says PAC", article_link: "https://www.freemalaysiatoday.com/category/nation/2024/12/05/lack-of-alternative-plan-will-hinder-ltats-transformation-says-pac/", image_link: nil, guid: "https://www.freemalaysiatoday.com/category/nation/2024/12/05/lack-of-alternative-plan-will-hinder-ltats-transformation-says-pac/", published_date: "2024-12-05 13:43:47 UTC", description: "Lack of alternative plan will hinder LTAT's transformation, says PAC. Public Accounts Committee member Dr Halimah Ali says this delay exposes the Armed Forces Fund Board to continued impairment." }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for trp/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/trp_test.xml")
    hash = { title: "Malaysia’s Potential Role As Hamas Haven Raises Strategic Questions", article_link: "https://www.therakyatpost.com/news/malaysia/2024/12/05/malaysias-potential-role-as-hamas-haven-raises-strategic-questions/", image_link: nil, guid: "https://www.therakyatpost.com/?p=931927", published_date: "2024-12-05 09:23:21 UTC", description: "The potential move comes at a crucial time in the ongoing Middle East conflict, as Hamas officials indicate they are awaiting increased international pressure on Israel before" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for tbp/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/tbp_test.xml")
    hash = { title: "Borneo artist spotlights sustainability in Kenyalang Circus exhibition in KL", article_link: "https://www.theborneopost.com/2024/12/05/borneo-artist-spotlights-sustainability-in-kenyalang-circus-exhibition-in-kl/", image_link: "https://www.theborneopost.com/newsimages/2024/12/FW1438942_KL44_05122024_BALAI_SENI-lpr.jpg", guid: "https://www.theborneopost.com/?p=1225340", published_date: "2024-12-05 14:05:42 UTC", description: "KUALA LUMPUR (Dec 5): A young artist from Borneo is transforming discarded polyester plastic into stunning textiles, blending tradition and sustainability in his Kenyalang Circus exhibition. Marcos" }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for mt/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/mt_test.xml")
    hash = { title: "Najib’s Affidavit: A Royal Script of Redemption or Political Theatre?", article_link: "https://www.malaysia-today.net/2024/12/05/najibs-affidavit-a-royal-script-of-redemption-or-political-theatre/", image_link: "https://www.malaysia-today.net/wp-content/uploads/2024/12/BHMOHONDENDUM_BHfield_image_socialmedia-425x250.webp", guid: "https://www.malaysia-today.net/?p=242688", published_date: "2024-12-05 08:28:52 UTC", description: "Afidavit Nizar Najib: Benarkah ini jalan menuju pengampunan, atau sekadar satu lagi drama politik?” Di sebalik dokumen ini, tersembunyi kisah yang mungkin mengubah segalanya. Apa sebenarnya kebenaran?The" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for cilisos/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/cilisos_test.xml")
    hash = { title: "The legendary Prosperity Burger makes a return to McDonald’s Malaysia", article_link: "https://cilisos.my/legendary-prosperity-burger-returns-mcdonalds-malaysia/", image_link: "https://cilisos.my/wp-content/uploads/2024/12/Prosperity-Burger-250x140.jpg", guid: "https://cilisos.my/?p=165508", published_date: "2024-12-03 13:54:56 UTC", description: "McDonald’s Malaysia is bringing joy to Malaysians once more with the highly anticipated comeback of the Prosperity Burger. Made in ...The post The legendary Prosperity Burger makes" }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for tmr/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/tmr_test.xml")
    hash = { title: "Nova Scotia becomes first province to publicly reimburse JEMPERLI for the treatment of patients with advanced or recurrent dMMR/MSI-H endometrial cancer", article_link: "https://themalaysianreserve.com/2024/12/05/nova-scotia-becomes-first-province-to-publicly-reimburse-jemperli-for-the-treatment-of-patients-with-advanced-or-recurrent-dmmr-msi-h-endometrial-cancer/", image_link: "https://mma.prnewswire.com/media/2574443/GlaxoSmithKline_Inc__Nova_Scotia_becomes_first_province_to_publi.jpg", guid: "https://themalaysianreserve.com/2024/12/05/nova-scotia-becomes-first-province-to-publicly-reimburse-jemperli-for-the-treatment-of-patients-with-advanced-or-recurrent-dmmr-msi-h-endometrial-cancer/", published_date: "2024-12-05 14:43:00 UTC", description: "Endometrial cancer is the most common gynaecological cancer, and its incidence has been steadily increasing over the past 20 years.[i] Approximately 20-29% of all endometrial cancers are" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for wob/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/wob_test.xml")
    hash = { title: "“A Big Thank You to M’sians!” Access Up to 17 Channels, Box Upgrades & More Await All Astro Customers", article_link: "https://worldofbuzz.com/a-big-thank-you-to-msians-access-up-to-17-channels-box-upgrades-more-await-all-astro-customers/?utm_source=rss&#038;utm_medium=rss&#038;utm_campaign=a-big-thank-you-to-msians-access-up-to-17-channels-box-upgrades-more-await-all-astro-customers", image_link: "https://worldofbuzz.com/wp-content/uploads/2024/12/ENG-KV-Astros-Big-Thank-You.jpg", guid: "https://worldofbuzz.com/?p=703975", published_date: "2024-12-05 13:20:38 UTC", description: "Whether when we’re hooked on a gripping TV series or blockbuster film, or just want something fun and educational for our children to watch, there’s no denying" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for soya/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/soya_test.xml")
    hash = { title: "iQoo 13 Malaysia: Snapdragon 8 Elite, 144Hz 2K display and 6,150mAh battery, priced from RM3,499", article_link: "https://soyacincau.com/2024/12/05/iqoo-13-malaysia-launch-price-specs/", image_link: "https://soyacincau.com/wp-content/uploads/2024/12/241205-iqoo-13-malaysia-launch-02-1024x576.jpg", guid: "https://soyacincau.com/?p=408676", published_date: "2024-12-05 09:23:01 UTC", description: "Malaysia gets another Snapdragon 8 Elite powered smartphone with the arrival of the iQoo 13. Besides rocking a new flagship-class 3nm chip, the iQoo 13 also boasts" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for india/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/india_test.xml")
    hash = { title: "PAK vs ZIM: Pakistan is unable to win even against Zimbabwe, dreams of winning the Champions Trophy | WATCH", article_link: "https://www.india.com/sports/pak-vs-zim-pakistan-is-unable-to-win-even-against-zimbabwe-dreams-of-winning-the-champions-trophy-watch-7444614/", image_link: nil, guid: "https://www.india.com/?p=7444614", published_date: "2024-12-05 16:24:38 UTC", description: "This time the hosting of Champions Trophy 2025 is in the hands of Pakistan. Pakistani fans are very happy that their team seems to be the biggest" }


    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for nypost/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/nypost_test.xml")
    hash = { title: "Doctor says common Christmas decoration should be ‘outlawed’ for injuring children", article_link: "https://nypost.com/2024/12/05/lifestyle/doctor-says-common-christmas-decoration-should-be-outlawed-for-injuring-children/", image_link: nil, guid: "https://nypost.com/?post_type=article&#038;p=34017075", published_date: "2024-12-05 16:50:51 UTC", description: "Doctor says common Christmas decoration should be ‘outlawed’ for injuring children. “This is your sign to not use stocking holders this year,” she begins in recent clip." }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for bi/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/bi_test.xml")
    hash = { title: "Vox Media is laying off staff as part of a reorg. Here's the memo outlining the changes.", article_link: "https://www.businessinsider.com/vox-media-lays-off-staff-at-lifestyle-brands-thrillist-eater-2024-12", image_link: "https://i.insider.com/6751d39f34ef9f0108f4ed60?format=jpeg", guid: "https://www.businessinsider.com/vox-media-lays-off-staff-at-lifestyle-brands-thrillist-eater-2024-12", published_date: "2024-12-05 16:40:58 UTC", description: "Vox Media is laying off staff as part of a reorg. Here's the memo outlining the changes.. The reductions at Vox Media impacted lifestyle brands including Thrillist, PS, and Eater. CEO Jim Bankoff announced the cuts in a memo to staff." }

    assert_equal parser.parse_xml(test_xml).first, hash
  end

  test "parse_xml for thesun/atom" do
    parser = XmlParser.new("https://whatever.com")
    test_xml = File.open("./test/services/xml/atom/thesun_test.xml")
    hash = { title: "Major retailer drops brand-new £30 Sol de Janeiro travel set just in time for Christmas", article_link: "https://www.thesun.co.uk/fabulous/32126269/sol-je-janeiro-delicia-drench-travel-set/", image_link: "https://www.thesun.co.uk/wp-content/uploads/2024/12/sol-de-janeiro-set-z_a8fa8f.jpg?strip=all", guid: "Post 32126269 at The Sun", published_date: "2024-12-05 16:59:36 UTC", description: "SOL de Janeiro’s new Delicia Drench Set has dropped at Space NK – and it’s set to be a smash-hit with beauty fans. The stand-out of the" }

    assert_equal parser.parse_xml(test_xml).first, hash
  end
end
