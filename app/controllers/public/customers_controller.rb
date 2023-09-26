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
    if Rails.env.production?
      @random_topics = @genre.topics.order("RAND()").limit(5) # ランダムなトピックを5つ取得
    elsif Rails.env.development?
      @random_topics = @genre.topics.order("RANDOM()").limit(5) # ランダムなトピックを5つ取得
    end
  end



end
