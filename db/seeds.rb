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
  # { name: "Business Insider", rss_url: "https://feeds.businessinsider.com/custom/all", default_category: "Business", language: "en" },
  # { name: "EatDrinkKL", rss_url: "https://www.eatdrinkkl.com/posts.atom", default_category: "Food", language: "en" },
  { name: "SAYS", rss_url: "https://says.com/my/rss", default_category: "News", language: "en" },
  # { name: "Harian Metro", rss_url: "https://www.hmetro.com.my/feed", default_category: "Berita", language: "ms" },
  { name: "Utusan Malaysia", rss_url: "https://www.utusan.com.my/feed/", default_category: "Berita", language: "ms" }
]

publishers.each do |pub|
  publisher = Publisher.new(name: pub[:name], rss_url: pub[:rss_url])
  publisher.default_category = Category.find_or_create_by(name: pub[:default_category])
  publisher.language = Language.find_or_create_by(code: pub[:language])
  publisher.save
end
