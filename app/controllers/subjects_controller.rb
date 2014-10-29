class SubjectsController < ApplicationController
  def index
  end
  def new
    if logged_in
      @subject = Subject.new
    else
      redirect_to(topics_url)
    end
  end
  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to(topic_subject_url(@subject.topic_id,@subject.id))
    else
      flash.now[:errors] = @subject.errors.full_messages
      render :new
    end
  end
  def show
    @subject = Subject.find_by_id(params[:id])
  end
  def destroy
    @subject = Subject.find_by_id(params[:id])
    @topic = @subject.topic
    @subject.destroy
    redirect_to(topic_url(@topic))
  end
  def edit

    @subject = Subject.find_by_id(params[:id])
    if logged_in && current_user.id == @subject.user_id
      render :edit
    else
      redirect_to topics_url
    end
  end
  def update
    @subject = Subject.find_by_id(params[:id])
    if @subject.update_attributes(subject_params)
      topic = Topic.find_by_title(params["subject"]["board_title"])
      if topic
        @subject.update_attributes(topic_id: topic.id)
        redirect_to topic_subject_url(@subject.topic_id, @subject.id)
      else
        flash.now[:errors] = "Thats not a valid board"
        render :edit
      end
    else
      flash.now[:errors] = @subject.errors.full_messages
      render :edit
    end
  end
  def subject_params
    params.require(:subject).permit(:title,:body,:user_id,:topic_id)
  end
end