class Api::RepliesController < ApplicationController
  before_filter :reguire_login

  def new
    @reply = Reply.new
    render :new
  end

  def create
    @reply = current_user.replies.new(reply_params)
    if @reply.save
      render :json => @reply
    else
      render :json => @reply.errors.full_messages, status: 422
    end
  end

  def index
    @replies = Reply.all
    render :json => @replies
  end
  def edit
    @reply = Reply.find(params[:id])
    render :show
  end
  def update
    @reply = Reply.find(params[:id])
    if @reply.update_attributes(reply_params)
      render :json => @reply
    else
      render :json => @reply.errors.full_messages, status: 422
    end
  end
  def show
    @reply = Reply.find(params[:id])
    render :show
  end
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    render :json => @reply
  end

  def reply_params
    params.require(:reply).permit(:content,:topic_id,:user_id)
  end

end
