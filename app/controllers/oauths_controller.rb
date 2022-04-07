class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    @user = login_from(provider)
    if @user
      redirect_back_or_to events_path, success: "#{provider.titleize}アカウントでログインしました。"
    else
      begin
        @user = create_from(provider)
        UserMailer.with(user: @user).welcome_email.deliver_later
        reset_session
        auto_login(@user)
        redirect_to edit_user_path(@user), success: '登録ありがとう！ついでに初期設定もよろしく！'
      rescue StandardError
        redirect_to root_path, danger: "#{provider.titleize}アカウントでのログインに失敗しました。"
      end
    end
  end
end
