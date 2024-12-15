class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_login

  def require_login
    unless logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to root_path
    end
  end
end
