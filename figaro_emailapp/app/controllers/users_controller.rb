class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end
  
def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Thank you!"
      redirect_to root_path
    else
      flash[:error] = "There was an error!"
      render :new
    end
end

private

  def user_params
    params.require(:user).permit(:email)
  end
  
end
