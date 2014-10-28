class UsersController < ApplicationController
  def index

  end

  def new
    if logged_in
      redirect_to(topics_url)
    else
      @user = User.new
      render :new
    end
  end
  def create
    @user = User.new(user_params)
    @user.admin = false
    if @user.save
      login(@user)
      redirect_to(topics_url)
    else
      if @user.password.length == 0
        flash.now[:errors] = "Password field empty"
      else
        flash.now[:errors] = @user.errors.full_messages
      end
      render :new
    end
  end

  def show
  end

  def edit
  end
  def update
  end
  def user_params
    params.require(:user).permit(:username,:password)
  end
end