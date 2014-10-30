class SessionsController < ApplicationController

  before_filter :require_logout, only: [:new, :create]
  before_filter :reguire_login, only: :destroy

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(session_params["username"],session_params["password"])
    if user
      login(user)
      redirect_to(boards_url)
    else
      flash.now[:errors] = "That username does not exist or you have the wrong password"
      @user = User.new(session_params)
      render :new
    end
  end

  def destroy
    logout
    redirect_to(boards_url)
  end

  def session_params
    params.require(:user).permit(:username,:password)
  end

end