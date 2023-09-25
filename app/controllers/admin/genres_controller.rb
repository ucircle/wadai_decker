class Admin::GenresController < ApplicationController

  def index

    @genre = Genre.new
    @genres = Genre.all

  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
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


  def destroy
  end

private

  def genre_params
     params.require(:genre).permit(:name)
  end


end
