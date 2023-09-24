class Public::GenresController < ApplicationController



  def index
    @genres = Genre.all

  end

  def show
    @genre = Genre.find(params[:id])
    @topics = @genre.topics.page(params[:page]).per(5)
    @new_topic = Topic.new
  end

  def new
    @topic = Topic.new
  end

  def create_topic
    @genre = Genre.find(params[:id])
    @new_topic = @genre.topics.build(topic_params) # 新しいトピックを作成し、ジャンルに関連付ける

    if @new_topic.save
      redirect_to genre_path(@genre), notice: 'トピックが投稿されました'
    else
      render :'public/genres/show'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre=Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      flash.now[:alert] = @genre.errors.full_messages.join(",")
      render :edit
    end
  end

  private

  def topic_params
     params.require(:topic).permit(:title, :image)
  end

end
