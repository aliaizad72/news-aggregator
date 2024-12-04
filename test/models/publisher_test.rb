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
    publisher = Publisher.new(name: "Harian Metro", rss_url: "https://www.hmetro.com.my/feed")
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
end
