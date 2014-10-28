class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    render :index
  end
  def new
    if !logged_in || (current_user.admin == false)
      redirect_to(topics_url)
    else
      @topic = Topic.new
      render :new
    end
  end
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to(topics_url)
    else
      flash.now[:errors] = @topic.errors.full_messages
      render :new
    end

  end
  def destroy
     Topic.find(params[:id]).destroy
     @topics = Topic.all
     render :index
  end
  def topic_params
    params.require(:topic).permit(:title, :admin_in)
  end


end