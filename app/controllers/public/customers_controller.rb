class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def bookmarks
    @bookmarked_topics = current_customer.bookmarks.map(&:topic)
    # ブックマーク一覧を取得してインスタンス変数に格納
  end
end
