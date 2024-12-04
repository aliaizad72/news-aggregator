require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "happy path" do
    cat = Category.new(name: "food")
    assert cat.valid?
  end

  test "must be unique" do
    cat = Category.new(name: "news") # exist in fixtures
    assert_not cat.valid?
    assert_equal cat.errors.first.type, :taken
  end

  test "category - publishers association" do
    cat = Category.first
    publisher = Publisher.new(name: "Harian Metro", rss_url: "https://www.hmetro.com.my/feed")
    cat.publishers << publisher
    assert_equal publisher.default_category, cat
  end
end
