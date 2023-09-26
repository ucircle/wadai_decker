class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
   if params[:topic_id].present?
    @topic = Topic.find(params[:topic_id])
    @genre = @topic.genre
   else
    @genre = Genre.first
   end

    @bookmarked_topics = @customer.bookmarked_topics
    @random_topics = []
    Topic.order("RANDOM()").limit(5).each do |topic|
      topic.set_url(genre_topic_path(topic.genre, topic))
      @random_topics.push(topic)
    end

  end



end
