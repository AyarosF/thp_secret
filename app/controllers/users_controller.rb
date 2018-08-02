class UsersController < ApplicationController

 before_action :logged_in_user, only: [:index, :edit, :update]

  def index
     @users = User.all
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
  end

  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Salut salut !"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
    end
  def destroy
  end
end
