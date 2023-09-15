class Public::TopicsController < ApplicationController

  def index
    @genres = Genre.all

    if params[:q]
      @search = Item.ransack(params[:q])
      @topics = @search.result(distinct: true).page(params[:page]).per(6)
    else
      @topics = Topic.page(params[:page]).per(6)
    end

  end

  def show
    @topic = Topic.find(params[:id])
    @genre = @topic.genre
    @comment = Comment.new
  end


  def new
    @topic = Topic.new
  end

  def create
    @genre = Genre.find(params[:genre_id]) # ジャンルを取得
    @topic = @genre.topics.build(topic_params) # ジャンルに関連づけてトピックを作成
    if @topic.save
      redirect_to genre_path(@genre), notice: 'トピックが投稿されました' # ジャンル詳細ページにリダイレクト
    else
      render :new
    end
  end

  private

  def topic_params
  params.permit(:title)
  end
end