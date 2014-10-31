class BoardsController < ApplicationController

  before_filter :reguire_login, except: [:index, :show]
  before_filter :require_admin, except: [:index, :show]

  def index
    @boards = Board.all
    render :index
  end

  def new
    @board = Board.new
    render :new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to(boards_url)
    else
      flash.now[:errors] = @board.errors.full_messages
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
    render :show
  end

  def destroy
     Board.find(params[:id]).destroy
     @boards = Board.all
     render :index
  end

  def edit
    @board = Board.find(params[:id])
    render :edit
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(board_params)
      redirect_to(boards_url)
    else
      flash.now[:errors] = @topic.errors.full_messages
      render :edit
    end
  end

  def board_params
    params.require(:board).permit(:title, :admin_id)
  end

end