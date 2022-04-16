class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login
  include Pundit

  def not_authenticated
    redirect_to root_path, warning: 'ログインしてください'
  end
end
