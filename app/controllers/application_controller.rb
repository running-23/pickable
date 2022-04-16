class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :category_not_authorized

  private

  def not_authenticated
    redirect_to root_path, warning: 'ログインしてください'
  end

  def category_not_authorized
    redirect_to root_path, danger: '権限がありません'
  end
end
