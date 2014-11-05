class Api::TopicsController < ApplicationController

  before_filter :reguire_login, except: [:index, :show]
  before_filter :require_admin, except: [:index, :show]

  def index
    @topics = Topic.all
    render :json => @topics
  end
  def show
    @topic = Topic.find(params[:id])
    render :show
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      render :json => @topic
    else
      render :json => @topic.errors.full_messages, status: 422
    end
  end

  def destroy
    Topic.find(params[:id]).destroy
    @topics = Topic.all
    render :json => "topic destroyed"
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      render :json => @topic
    else
      render :json => @topic.errors.full_messages, status: 422
    end
  end

  def topic_params
    params.require(:topic).permit(:title,:body,:user_id,:board_id)
  end

end
