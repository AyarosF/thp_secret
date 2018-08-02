class UsersController < ApplicationController
  def index
  end

  def show
    @username = User.find(params[:id]).username
    @email = User.find(params[:id]).email
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
      #flash[:success] = "Profile updated"
      redirect_to @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #log_in @user
      #flash[:success] = "Salut salut !"
      redirect_to @user
      # Handle a successful save.
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
