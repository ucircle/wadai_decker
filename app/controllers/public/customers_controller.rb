class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
   if params[:topic_id].present?
    @topic = Topic.find(params[:topic_id])
    @genre = @topic.genre
   else
    # トピックが指定されていない場合、デフォルトのジャンルを設定できます
    # 例えば、データベース内の最初のジャンルに設定することができます
    @genre = Genre.first
   end
  end

  

  def bookmarks
    @bookmarked_topics = current_customer.bookmarks.map(&:topic)
    # ブックマーク一覧を取得してインスタンス変数に格納
  end
end
