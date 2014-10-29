class RepliesController < ApplicationController

  def new
    if logged_in
      @reply = Reply.new
      render :new
    else
      redirect_to topics_url
    end
  end
  def create

    @reply = Reply.new(content: params["reply"]["content"], user_id: current_user.id, subject_id: params["subject_id"])
    if @reply.save
      redirect_to topic_subject_url(params["topic_id"],params["subject_id"])
    else
      flash.now[:errors] = @reply.errors.full_messages
      render :new
    end


  end
  def destroy

    @reply = Reply.find_by_id(params[:id])
    @reply.destroy
    redirect_to topic_subject_url(params["topic_id"],params["subject_id"])
  end
  def show
  end
  def edit
    @reply = Reply.find_by_id(params[:id])
    if logged_in && current_user.id == @reply.user_id
      render :edit
    else
      redirect_to topics_url
    end
  end
  def update
    @reply = Reply.find_by_id(params[:id])
    @reply.update_attributes(content: params["reply"]["content"])
    if @reply.save
      redirect_to topic_subject_url(params["topic_id"],params["subject_id"])
    else
      flash.now[:errors] = @reply.errors.full_messages
      render :edit
    end
  end

end
