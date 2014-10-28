class SubjectsController < ApplicationController
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
  def subject_params
    params.require(:subject).permit(:title,:body,:user_id,:topic_id)
  end
end