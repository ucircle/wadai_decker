class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def destroy
    @comment = Comment.find(params[:id])

    if current_customer.admin?  # 管理者のみがコメントを削除できる条件
      @comment.destroy
      flash[:notice] = 'コメントを削除しました'
    else
      flash[:alert] = 'コメントを削除する権限がありません'
    end

    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
