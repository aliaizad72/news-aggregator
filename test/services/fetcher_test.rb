require "test_helper"

class FetcherTest < ActiveSupport::TestCase
  test "fetch happy path" do
    response =  Fetcher.new.fetch("https://hmetro.com.my/feed")
    assert_equal response.status[0], "200"
  end

  test "fetch http error" do
    response =  Fetcher.new.fetch("https://www.hmetro.com.my/f")
    assert response.instance_of?(OpenURI::HTTPError)
  end

  test "fetch Connection Error" do
    response =  Fetcher.new.fetch("https://www.tro.m.my/f")
    assert response.kind_of?(SocketError)
  end

  test "xml?" do
    response =  Fetcher.new.fetch("https://hmetro.com.my")
    assert_not Fetcher.new.response_xml?(response)
  end
end
