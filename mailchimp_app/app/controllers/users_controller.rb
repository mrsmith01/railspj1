class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Thank you for signing up for the EDSDev mailing list!"
      redirect_to root_path
    else
      flash[:error] = "There was an error, please try again!"
      render :new
    end
  end

private

  def user_params
   params.require(:user).permit(:email)
  end
end
