class PublishersController < ApplicationController
  def show
    @publisher = Publisher.find_by(id: params[:id])

    redirect_back_or_to :root_path if @publisher.nil?

    @articles = @publisher.articles
  end
end
