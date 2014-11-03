class Api::BoardsController < ApplicationController

  before_filter :reguire_login, except: [:index, :show]
  before_filter :require_admin, except: [:index, :show]

  def index
    @boards = Board.all
    render :json => @boards
  end

  def show
    @board = Board.find(params[:id])
    render :show
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      render :json => "board created"
    else
      render :json => @board.errors.full_messages
    end
  end

  def destroy
    Board.find(params[:id]).destroy
    @boards = Board.all
    render :json => "board destroyed"
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(board_params)
      render :json => "success"
    else
      render :json => @board.errors.full_messages
    end
  end

  def board_params
    params.require(:board).permit(:title, :admin_id)
  end

end