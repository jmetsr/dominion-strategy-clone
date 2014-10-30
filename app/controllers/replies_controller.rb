class RepliesController < ApplicationController

  before_filter :reguire_login, except: [:index, :show]

  def new
    @reply = Reply.new
    render :new
  end

  def create
    @reply = Reply.new(content: params["reply"]["content"], user_id: current_user.id, topic_id: params[:topic_id])
    if @reply.save
      redirect_to topic_url(params[:topic_id])
    else
      flash.now[:errors] = @reply.errors.full_messages
      render :new
    end
  end

  def destroy
    @reply = Reply.find_by_id(params[:id])
    topic = @reply.topic
    @reply.destroy
    redirect_to topic_url(topic)
  end

  def show
  end

  def edit
    @reply = Reply.find_by_id(params[:id])
    if logged_in && current_user.id == @reply.user_id
      render :edit
    else
      redirect_to boards_url
    end
  end

  def update
    @reply = Reply.find_by_id(params[:id])
    @reply.update_attributes(content: params[:reply][:content])
    if @reply.save
      redirect_to topic_url(@reply.topic)
    else
      flash.now[:errors] = @reply.errors.full_messages
      render :edit
    end
  end
end
