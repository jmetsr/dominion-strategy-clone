class UsersController < ApplicationController

  before_filter :reguire_login, except: [:new, :create, :show]
  before_filter :require_logout, only: [:new, :create]

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.admin = false
    if @user.save
      login(@user)
      redirect_to(boards_url)
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
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
    if (@user == current_user) || (current_user.admin)
      render :edit
    else
      redirect_to(boards_url)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      if current_user.admin && (params[:admin] == "true")
        @user.update_attributes(admin: true)
      end
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to("#")
  end

  def user_params
    params.require(:user).permit(:username,:password)
  end
end
