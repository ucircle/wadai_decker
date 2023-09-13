class Public::GenresController < ApplicationController



  def index
    @genre = Genre.new
    @genres = Genre.all

  end

  def show
    @genre = Genre.find(params[:id])
    @topics = @genre.topics
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic, notice: 'トピックが投稿されました'
    else
      render :new
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
     params.require(:topic).permit(:title)
  end

end
