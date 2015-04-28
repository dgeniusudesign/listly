class UsersController < ApplicationController
  before_action :set_user

  def update
    @user.update(user_params)
    if @user.save
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def update_password
    @user.update(user_params)
    @user.is_password_set = true
    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
      render 'set_password'
    end
  end

  def set_password
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
