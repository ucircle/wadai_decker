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

end
