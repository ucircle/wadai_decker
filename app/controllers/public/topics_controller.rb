class Public::TopicsController < ApplicationController


def index
  @genres = Genre.all

  if params[:q]
    @topics = @search.result(distinct: true).page(params[:page]).per(6)
  elsif params[:tag_name]
    # タグによるフィルタリング
    @topics = Topic.tagged_with(params[:tag_name]).page(params[:page]).per(6)
  else
    @topics = Topic.page(params[:page]).per(6)
  end
end


  def show
    @topic = Topic.find(params[:id])
    @genre = @topic.genre
    @comment = Comment.new
    @tag_list = @topic.tag_list
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
      redirect_to genre_path(@genre)
    end
  end

def update
  @topic = Topic.find(params[:id])

  # フォームから送信された新しいタグを取得
  new_tags = params[:topic][:tag_list].split(",").map(&:strip)

  # 既存のタグと新しいタグを組み合わせる
  combined_tags = @topic.tag_list + new_tags

  if @topic.update(tag_list: combined_tags)
    redirect_to genre_topic_path(@topic.genre, @topic), notice: 'タグが更新されました'
  else
    flash.now[:alert] = 'タグの更新に失敗しました'
    render :show
  end
end

def remove_tag
  @topic = Topic.find(params[:id])
  @tag_to_remove = params[:tag]

  if @topic.tag_list.remove(@tag_to_remove)
    @topic.save
    redirect_to genre_topic_path(@topic.genre, @topic), notice: 'タグが削除されました'
  else
    flash.now[:alert] = 'タグの削除に失敗しました'
    render :show
  end
end

def random_topics
  genre_id = params[:genre_id] # ジャンルIDをパラメーターから取得
  @genre = Genre.find(genre_id)


  if Rails.env.production?
    random_topics = @genre.topics.order("RAND()").limit(5) # ランダムなトピックを5つ取得
  elsif Rails.env.development?
    random_topics = @genre.topics.order("RANDOM()").limit(5) # ランダムなトピックを5つ取得
  end
  # ランダムトピックにURLを設定
  @random_topics = []
  random_topics.each do |topic|
    topic.url = genre_topic_path(@genre, topic)
    @random_topics.push(topic)
  end
  respond_to do |format|
    format.json { render json: @random_topics }
  end
end

=begin
def random_topics
    @genre = Genre.find(params[:genre_id])

    if Rails.env.production?
      @random_topics = Topic.order("RAND()").limit(5) # ランダムなトピックを5つ取得
    elsif Rails.env.development?
      @random_topics = Topic.order("RANDOM()").limit(5)
    end
    respond_to do |format|
    format.html
    format.js
  end
end
=end

private

  def topic_params
  params.require(:topic).permit(:title, :tag_list)
  end
end