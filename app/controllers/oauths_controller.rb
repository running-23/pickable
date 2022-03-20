class OauthsController < ApplicationController
  skip_before_action :require_login

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_back_or_to root_path, notice: "#{provider.titleize}アカウントでログインしました。"
    else
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user)
        redirect_to events_path, notice: "#{provider.titleize}アカウントでログインしました。"
      rescue
        redirect_to root_path, notice: "#{provider.titleize}アカウントでのログインに失敗しました。"
      end
    end
   end
end