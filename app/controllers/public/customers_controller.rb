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

    if Rails.env.production?
      random_topics = Topic.order("RAND()").limit(5)
    elsif Rails.env.development?
      random_topics = Topic.order("RANDOM()").limit(5)
    end

    random_topics.each do |topic|
      topic.set_url(genre_topic_path(topic.genre, topic))
      @random_topics.push(topic)
    end


  end



end
