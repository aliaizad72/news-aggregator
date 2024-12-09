class PublishersController < ApplicationController
  def show
    @publisher = Publisher.find_by(id: params[:id])

    redirect_back_or_to :root_path if @publisher.nil?

    id = @publisher.language_id
    articles = @publisher.articles

    @publishers = Publisher.all.distinct
    @categories = Category.all.where(language_id: id)
    @pagy, @articles = pagy(articles, limit: 5)
  end
end
