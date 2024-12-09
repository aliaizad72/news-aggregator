class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])

    redirect_back_or_to :root_path if @category.nil?

    id = @category.language_id
    articles = @category.articles

    @publishers = Publisher.all.distinct
    @categories = Category.all.where(language_id: id)
    @pagy, @articles = pagy(articles, limit: 5)  end
end
