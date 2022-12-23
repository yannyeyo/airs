# frozen_string_literal: true

# User controller
class UsersController < ApplicationController
  before_action :no_autorize, only: %i[new create]
  before_action :autorize, only: %i[edit update]

  def index; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    return unless @user.save

    session[:user_id] = @user.id
    flash[:success] = "Добро пожаловать, #{@user.first_name}!"
    redirect_to home_path
  end

  def update
    @flag = false
    return unless current_user.update user_params

    @flag = true
    flash[:notice] = 'Профиль обновлен'
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :second_name, :password, :password_confirmation, :phone,
                                 :old_password)
  end
end