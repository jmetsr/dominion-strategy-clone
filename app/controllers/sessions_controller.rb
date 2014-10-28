class SessionsController < ApplicationController
  def new
    if logged_in
      redirect_to(topics_url)
    else
      @user = User.new
      render :new
    end
  end
  def create
    user = User.find_by_credentials(session_params["username"],session_params["password"])
    if user
      login(user)
      redirect_to(topics_url)
    else
      flash.now[:errors] = "That username does not exist or you have the wrong password"
      @user = User.new(session_params)
      render :new
    end

  end
  def destroy
    logout
    redirect_to(topics_url)
  end
  def session_params
    params.require(:user).permit(:username,:password)
  end

end