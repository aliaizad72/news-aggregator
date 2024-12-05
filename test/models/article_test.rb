require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "invalid url" do
    new_article = Article.new(title: "Title", published_date: "Wed, 04 Dec 2024 09:36:10 -0500", article_link: "google.com", guid: "asdad")
    new_article.language = Language.first
    new_article.category = Category.first
    new_article.publisher = Publisher.first

    assert_not new_article.valid?
    assert_equal new_article.errors.first.type, :invalid
  end

  test "only accepts articles with unique guid and publisher id key" do
    new_article = Article.new(title: "Title", published_date: "Wed, 04 Dec 2024 09:36:10 -0500", article_link: "https://google.com", guid: Article.first.guid)
    new_article.language = Language.first
    new_article.category = Category.first
    new_article.publisher = Article.first.publisher

    assert_not new_article.save
    assert_equal new_article.errors.first.type, :taken
  end
end
