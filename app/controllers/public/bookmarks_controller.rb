class Public::BookmarksController < ApplicationController


  # ブックマークを作成するアクション
  def create
    @topic = Topic.find(params[:topic_id])
    current_customer.bookmark(@topic)
    redirect_to genre_topic_path(@topic.genre, @topic), notice: 'トピックをブックマークしました'
  end

  # ブックマークを削除するアクション
  def destroy
    @topic = Bookmark.find(params[:id]).topic
    current_customer.unbookmark(@topic)
    redirect_to genre_topic_path(@topic.genre, @topic), notice: 'トピックのブックマークを解除しました'
  end
end
