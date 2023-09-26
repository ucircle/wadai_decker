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
  end
  
  def random_topics
    @genre = Genre.find(params[:genre_id])

    if Rails.env.production?
      random_topics = @genre.topics.order("RAND()").limit(5) # ランダムなトピックを5つ取得
    elsif Rails.env.development?
      random_topics = @genre.topics.order("RANDOM()").limit(5) # ランダムなトピックを5つ取得
    end
    # ランダムトピックにURLを設定
    @random_topics = []
    random_topics.each do |topic|
      topic.url = genre_topic_path(@genre, topic)
      @random_topics.push(topic)
    end
    respond_to do |format|
      format.json { render json: @random_topics }
    end
    
  end



end
