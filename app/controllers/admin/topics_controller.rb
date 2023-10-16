class Admin::TopicsController < ApplicationController
  before_action :authenticate_admin!


  def destroy
    @topic = Topic.find(params[:id])

    # トピックを削除する処理
    if @topic.destroy
      flash[:notice] = "トピックが削除されました。"
      redirect_to root_path
    else
      flash[:alert] = "トピックの削除に失敗しました。"
      redirect_back fallback_location: root_path
    end
  end


end
