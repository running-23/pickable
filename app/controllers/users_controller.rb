class UsersController < ApplicationController
  before_action :set_user, only: %i[edit show update]
  def edit; end

  def show
    @future_events = current_user.participating_events.includes(%i[user category])
      .where(scheduled_date: Time.current..Time.current.since(1.year))
    @past_events = current_user.participating_events.includes(%i[user category])
      .where(scheduled_date: Time.current.ago(1.year)...Time.current).order(scheduled_date: :desc)
  end

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
    params.require(:user).permit(:name, :hiyoconne_url, :accept_random, category_ids: [])
  end
end
