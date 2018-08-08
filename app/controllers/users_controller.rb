class UsersController < ApplicationController
  def new
  end

  def create
  @user = User.new(user_params)

  if @user.save
    flash[:notice] = "You signed up successfully"
    flash[:color]= "valid"
  else
    flash[:notice] = "Form is invalid"
    flash[:color]= "invalid"
  end
end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password,)
  end
end
