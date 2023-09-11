class Public::TopicsController < ApplicationController
  
  def index
    def index
    @genres = Genre.all

    if params[:q]
      @search = Item.ransack(params[:q])
      @topics = @search.result(distinct: true).page(params[:page]).per(6)
    else
      @topics = Topic.page(params[:page]).per(6)
    end

    @items_all = Item.all
  end
  end
  
  def show
    @topic = Topic.find(params[:id])
    
  end
  
  def new
    
  
  def create
  end
end
