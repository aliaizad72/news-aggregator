class ArticlesController < ApplicationController
  def index
    @code = params[:lang]

    if @code
      id = Language.find_by(code: @code).id
    else
      id = Language.find_by(code: "en").id
    end

    @articles = Article.includes(:publisher, :category).where(language_id: id).order(published_date: :desc)
  end
end
