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
      render 'public/topics/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
