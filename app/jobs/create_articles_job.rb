class CreateArticlesJob
  include Sidekiq::Job

  sidekiq_options retry: 2

  def perform(publisher_id)
    # Do something later
    publisher = Publisher.find_by(id: publisher_id)
    return unless publisher

    ArticleCreator.new(publisher).create

    self.class.perform_in(1.hour, publisher_id)
  end
end
