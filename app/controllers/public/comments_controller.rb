class Public::CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @genre = @topic.genre # トピックからジャンルを取得
    @comment = @topic.comments.build(comment_params)
    @comment.customer = current_customer # 顧客をコメントに関連付ける

    if @comment.save
      redirect_to genre_topic_path(@genre, @topic), notice: 'コメントが投稿されました'
    else
      flash.now[:alert] = 'コメントの投稿に失敗しました'
      redirect_to genre_topic_path(@genre, @topic)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if current_customer == @comment.customer  # 管理者のみがコメントを削除できる条件
      @comment.destroy
      flash[:notice] = 'コメントを削除しました'
    end
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
