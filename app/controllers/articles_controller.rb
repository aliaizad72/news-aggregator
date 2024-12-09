class ArticlesController < ApplicationController
  def index
    @code = params[:lang_code]

    unless @code
      @code = "en"
    end

    id = Language.find_by(code: @code).id
    articles = Article.includes(:publisher, :category).where(language_id: id).order(published_date: :desc)
    @pagy, @articles = pagy(articles, limit: 5)
    @publishers = Publisher.all.distinct
    @categories = Category.all.where(language_id: id)
  end
end
