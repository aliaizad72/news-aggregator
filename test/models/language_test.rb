require "test_helper"

class LanguageTest < ActiveSupport::TestCase
  test "happy path" do
    lang = Language.new(code: "en")
    assert lang.valid?
  end

  test "invalid code" do
    lang = Language.new(code: "English")
    assert_not lang.valid?
    assert_equal lang.errors.where(:code).first.type, :not_a_code
  end

  test "code already exists in table" do
    lang = Language.new(code: "en")
    lang.save
    lang_2 = Language.new(code: "en")
    assert_not lang_2.valid?
    assert_equal lang_2.errors.first.type, :taken
  end

  test "language - publishers associations" do
    lang = Language.create(code: "en")
    publisher = Publisher.create(name: "SAYS", rss_url: "https://says.com/my/rss")
    publisher_2 = Publisher.create(name: "EatDrinkKL", rss_url: "https://www.eatdrinkkl.com/posts.atom")
    lang.publishers << publisher
    lang.publishers << publisher_2

    assert_equal publisher.language, lang
    assert_equal publisher_2.language, lang
  end

  test "language - articles associations" do
    lang = Language.create(code: "en")
    new_article = Article.new(title: "Title", published_date: "Wed, 04 Dec 2024 09:36:10 -0500", article_link: "https://google.com", guid: Article.first.guid)
    new_article.category = Category.first
    new_article.publisher = Article.last.publisher

    lang.articles << new_article

    assert_equal new_article.language, lang
  end
end
