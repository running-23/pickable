class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new]

  def new; end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
