class TopicsController < ApplicationController

  before_filter :reguire_login, except: [:index, :show]

  def index
  end

  def new
    @topic = Topic.new
    render :new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to(topic_url(@topic))
    else
      flash.now[:errors] = @topic.errors.full_messages
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])
    @board = @topic.board
    @topic.destroy
    redirect_to(board_url(@board))
  end

  def edit
    @topic = Topic.find(params[:id])
    if current_user.id == @topic.user_id
      render :edit
    else
      redirect_to boards_url
    end
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      redirect_to topic_url(@topic)
    else
      flash.now[:errors] = @topic.errors.full_messages
      render :edit
    end
  end

  def topic_params
    params.require(:topic).permit(:title,:body,:user_id,:board_id)
  end
end