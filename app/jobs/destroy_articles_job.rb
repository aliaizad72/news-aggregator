class DestroyArticlesJob
  include Sidekiq::Job

  def perform(article_id)
    article = Article.find_by(id: article_id)

    return unless article

    article.destroy
  end
end