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
languages.each do |code|
  Language.create(code: code)
end

english_categories = %w[Others Entertainment Lifestyle Business Technology Food Health News Sports Science Travel]
malay_categories = %w[Lain-lain Hiburan Gayahidup Niaga Teknologi Makanan Kesihatan Berita Sukan Sains Perlancongan]

categories = english_categories + malay_categories
categories.each do |cat|
  Category.create(name: cat)
end
publisher = Publisher.new(name: "New Straits Times", rss_url: "https://www.nst.com.my/feed")
publisher.default_category = Category.find_by(name: "News")
publisher.language = Language.first
publisher.save


