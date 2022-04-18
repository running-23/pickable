class UsersController < ApplicationController
  before_action :set_current_user, only: %i[edit update]
  before_action :set_user, only: %i[show]

  def edit; end

  def show
    participated_events = @user.participating_events
                                      .eager_load(:category, :participations)

    @events_from_today = participated_events.from_today
    @events_till_yesterday = participated_events.till_yesterday
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
    @user = User.find(params[:id])
  end

  def set_current_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :hiyoconne_url, :accept_random, category_ids: [])
  end
end
