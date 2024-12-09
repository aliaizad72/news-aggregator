class PublishersController < ApplicationController
  def show
    @publisher = Publisher.find_by(id: params[:id])

    redirect_to root_path if @publisher.nil?

    id = @publisher.language_id
    articles = @publisher.articles

    @publishers = Publisher.all.distinct
    @categories = Category.all.where(language_id: id)
    @pagy, @articles = pagy(articles, limit: 5)
  end

  def new
    @publisher = Publisher.new
  end

  def edit
    @publisher = Publisher.find_by(id: params[:id])

    redirect_back_or_to :root_path unless @publisher
  end

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      redirect_to publisher_path(@publisher)
    else
      flash[:alert] = @publisher.errors.first.message
      redirect_to new_publisher_path
    end
  end

  def update
    @publisher = Publisher.find_by(id: params[:id])

    if @publisher.update(publisher_params)
      redirect_to publisher_path(@publisher)
    else
      flash[:alert] = @publisher.errors.first.message
      redirect_to edit_publisher_path(@publisher)
    end
  end

  def destroy
    @publisher = Publisher.find_by(id: params[:id])
    @publisher.destroy
    redirect_to root_path
  end

  private

  def publisher_params
    params.expect(publisher: [ :name, :rss_url, :language_id, :category_id, :bilingual, :one_category ])
  end
end
