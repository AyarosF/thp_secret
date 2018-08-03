class UsersController < ApplicationController

 before_action :logged_in_user, only: [:index, :edit, :update]
 before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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
      flash[:success] = "Profil mis à jour"
      redirect_to @user
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def secret
    if logged_in?
      redirect_to '/answer'
    else
      redirect_to login_url
      flash[:success] = "Connecte toi pour connaître la réponse !"
  end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Voili voilou"
      redirect_to '/secret'
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
  end

end
