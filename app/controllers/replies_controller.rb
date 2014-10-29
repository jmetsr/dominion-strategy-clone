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

end
