class UsersController < ApplicationController
before_action :set_user, only: %i[edit show update]
  def edit; end

  def show; end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(@user), success: 'ユーザー情報が更新されました'
    else
      render :edit
    end
  end
  
  private
  
  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :accept_random, :category_id)
  end
end
