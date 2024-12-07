class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(published_date: :desc)
  end
end
