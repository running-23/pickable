class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new]

  def destroy
    logout
    redirect_to root_path, success: 'ログアウトしました'
  end
end
