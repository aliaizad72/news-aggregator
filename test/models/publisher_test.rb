require "test_helper"

class PublisherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should have name" do
    publisher = Publisher.new(rss_url: "https://www.hmetro.com.my/feed")
    assert_not publisher.save
  end

  test "should have valid URL" do
    publisher = Publisher.new(name: "Harian Metro", rss_url: "www.hmetro.com.my/feed")
    assert_not publisher.save
  end

  test "happy path" do
    lang = Language.create(code: "ms")
    publisher = Publisher.new(name: "Harian Metro", rss_url: "https://www.hmetro.com.my/feed", )
    lang.publishers << publisher
    assert publisher.save
  end

  test "response not returning xml" do
    publisher = Publisher.new(name: "Harian Metro", rss_url: "https://www.hmetro.com.my")
    assert_not publisher.valid?
    assert_equal publisher.errors.where(:rss_url).first.type, :not_xml
  end

  test "http error" do
    publisher = Publisher.new(name: "Harian Metro", rss_url: "https://www.hmetro.com.my/f")
    assert_not publisher.valid?
    assert_equal publisher.errors.where(:rss_url).first.type, :http_error
  end

  test "connection error" do
    publisher = Publisher.new(name: "Harian Metro", rss_url: "https://www.tro.m.my/f")
    assert_not publisher.valid?
    assert_equal publisher.errors.where(:rss_url).first.type, :connection_error
  end

  test "publishers - language association" do
    lang = Language.create(code: "ms")
    publisher = Publisher.new(name: "Harian Metro", rss_url: "https://www.hmetro.com.my/feed")
    publisher.language = lang
    publisher.save

    assert_equal lang.publishers.first, publisher
  end

  test "publishers - category association" do
    publisher = Publisher.new(name: "Harian Metro", rss_url: "https://www.hmetro.com.my/feed")
    publisher.language = Language.first
    publisher.default_category = Category.first
    publisher.save
    assert_equal Category.first.publishers.first, publisher
  end

  test "publishers - articles association" do
    publisher = Publisher.new(name: "Harian Metro", rss_url: "https://www.hmetro.com.my/feed")
    publisher.language = Language.first
    publisher.default_category = Category.first
    publisher.save

    new_article = Article.new(title: "Title", published_date: "Wed, 04 Dec 2024 09:36:10 -0500", article_link: "https://google.com", guid: Article.first.guid)
    new_article.language = publisher.language
    new_article.category = publisher.default_category
    publisher.articles << new_article

    assert_equal new_article.publisher, publisher
  end
end
