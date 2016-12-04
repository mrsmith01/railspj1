class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "You Signed Up Woooooo!!"
      redirect_to '/'
    else
      flash[:danger] = "There was an error signing you up, try again! "
      render :new
    end
  end
end

private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
