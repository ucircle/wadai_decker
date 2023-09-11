class Public::CommentsController < ApplicationController
  
  def create
    topic = Topic.find(params[:topic_id])
    comment = current_user.comments.new(comment_params)
    comment.topic_id = topic.id
    comment.save
    redirect_to topic_path(topic)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
