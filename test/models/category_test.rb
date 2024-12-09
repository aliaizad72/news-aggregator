require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "category must have language attributes" do
    lang = Language.create(code: "en")
    cat = Category.new(name: "news") # exist in fixtures
    lang.categories << cat
    assert_not cat.valid?
  end

  test "must be unique" do
    lang = Language.create(code: "en")
    cat = Category.new(name: "news") # exist in fixtures
    lang.categories << cat
    assert_not cat.valid?
    assert_equal cat.errors.first.type, :taken
  end

  test "category - publishers association" do
    cat = Category.first
    publisher = Publisher.new(name: "Harian Metro", rss_url: "https://www.hmetro.com.my/feed")
    cat.publishers << publisher
    assert_equal publisher.default_category, cat
  end

  test "category - article association" do
    cat = Category.first
    new_article = Article.new(title: "Title", published_date: "Wed, 04 Dec 2024 09:36:10 -0500", article_link: "https://google.com", guid: Article.first.guid)
    new_article.language = Language.first
    new_article.publisher = Article.first.publisher

    cat.articles << new_article

    assert_equal new_article.category, cat
  end
end
