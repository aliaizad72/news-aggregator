# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
languages = %w[en ms]
english_categories = %w[Entertainment Lifestyle Business Technology Food Health Sports Science Travel News Others]
malay_categories = %w[Hiburan Gayahidup Niaga Teknologi Makanan Kesihatan Sukan Sains Perlancongan Berita Lain-lain ]

languages.each do |code|
  lang = Language.create(code: code)
  if code == "en"
    categories = english_categories
  else
    categories = malay_categories
  end

  categories.each do |cat|
    category = Category.new(name: cat)
    lang.categories << category
  end
end

publishers = [
  { name: "EatDrinkKL", rss_url: "https://www.eatdrinkkl.com/posts.atom", default_category: "Food", language: "en" },
  { name: "SAYS", rss_url: "https://says.com/my/rss", default_category: "News", language: "en" },
  { name: "Harian Metro", rss_url: "https://www.hmetro.com.my/feed", default_category: "Berita", language: "ms" },
  # { name: "Business Insider", rss_url: "https://feeds.businessinsider.com/custom/all", default_category: "Business", language: "en" },
  # { name: "Bangsar Babe", rss_url: "https://www.bangsarbabe.com/feed/atom", default_category: "Food", language: "en" },
  # { name: "Cilisos", rss_url: "https://cilisos.my/feed/atom/", default_category: "News", language: "en" },
  { name: "Free Malaysia Today", rss_url: "https://www.freemalaysiatoday.com/feed/", default_category: "News", language: "en" },
  # { name: "India.com", rss_url: "https://www.india.com/feed/atom/", default_category: "News", language: "en" },
  # { name: "Malaysia Today", rss_url: "https://www.malaysia-today.net/feed/", default_category: "News", language: "en" },
  # { name: "New York Post", rss_url: "https://nypost.com/feed/atom/", default_category: "News", language: "en" },
  { name: "Soya Cincau", rss_url: "https://soyacincau.com/feed/atom/", default_category: "Technology", language: "en" },
  # { name: "The Borneo Post", rss_url: "https://www.theborneopost.com/feed/", default_category: "News", language: "en" },
  # { name: "The Sun", rss_url: "https://www.thesun.co.uk/feed/", default_category: "News", language: "en" },
  # { name: "The Malaysian Reserve", rss_url: "https://themalaysianreserve.com/feed/", default_category: "Business", language: "en" },
  # { name: "The Malaysian Insider", rss_url: "https://www.themalaysianinsight.com/feed", default_category: "News", language: "en" },
  # { name: "The Rakyat Post", rss_url: "https://www.therakyatpost.com/feed/atom/", default_category: "News", language: "en" },
  # { name: "World of Buzz", rss_url: "https://worldofbuzz.com/feed/atom/", default_category: "News", language: "en" },
  { name: "Al Jazeera", rss_url: "https://www.aljazeera.com/xml/rss/all.xml", default_category: "News", language: "en" },
  # { name: "CBS News", rss_url: "https://www.cbsnews.com/latest/rss/main", default_category: "News", language: "en" },
  # { name: "Daily Mail", rss_url: "https://www.dailymail.co.uk/home/index.rss", default_category: "News", language: "en" },
  # { name: "Fox News", rss_url: "https://moxie.foxnews.com/google-publisher/latest.xml", default_category: "News", language: "en" },
  { name: "The Guardian", rss_url: "https://www.theguardian.com/uk/rss", default_category: "News", language: "en" },
  # { name: "The Independent", rss_url: "https://www.independent.co.uk/rss", default_category: "News", language: "en" },
  { name: "Kosmo", rss_url: "https://www.kosmo.com.my/feed/", default_category: "Berita", language: "ms" },
  # { name: "NBC", rss_url: "https://feeds.nbcnews.com/nbcnews/public/news", default_category: "News", language: "en" },
  # { name: "NDTV News", rss_url: "https://feeds.feedburner.com/ndtvnews-top-stories", default_category: "News", language: "en" },
  # { name: "News18", rss_url: "https://www.news18.com/commonfeeds/v1/eng/rss/latest.xml", default_category: "News", language: "en" },
  { name: "New Straits Times", rss_url: "https://www.nst.com.my/feed", default_category: "News", language: "en" },
  # { name: "RT", rss_url: "https://www.rt.com/rss", default_category: "News", language: "en" },
  # { name: "Sarawak Report", rss_url: "https://www.sarawakreport.org/feed/", default_category: "News", language: "en" },
  # { name: "The Telegraph", rss_url: "http://www.telegraph.co.uk/rss.xml", default_category: "News", language: "en" },
  { name: "Utusan Malaysia", rss_url: "https://www.utusan.com.my/feed/", default_category: "Berita", language: "ms" }
]

publishers.each_with_index do |pub, ind|
  publisher = Publisher.new(name: pub[:name], rss_url: pub[:rss_url])
  publisher.default_category = Category.find_or_create_by(name: pub[:default_category])
  publisher.language = Language.find_or_create_by(code: pub[:language])
  publisher.save
  puts "#{ind + 1} Publisher Created"
end
