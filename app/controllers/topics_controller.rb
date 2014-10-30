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
    @topic = Topic.find_by_id(params[:id])
  end

  def destroy
    @topic = Topic.find_by_id(params[:id])
    @board = @topic.board
    @topic.destroy
    redirect_to(board_url(@board))
  end

  def edit
    @topic = Topic.find_by_id(params[:id])
    if current_user.id == @topic.user_id
      render :edit
    else
      redirect_to boards_url
    end
  end

  def update
    @topic = Topic.find_by_id(params[:id])
    if @topic.update_attributes(topic_params)
      board = Board.find_by_title(params[:topic][:board_title])
      if board
        @topic.update_attributes(board_id: board.id)
        redirect_to topic_url(@topic)
      else
        flash.now[:errors] = "Thats not a valid board"
        render :edit
      end
    else
      flash.now[:errors] = @topic.errors.full_messages
      render :edit
    end
  end

  def topic_params
    params.require(:topic).permit(:title,:body,:user_id,:board_id)
  end
end