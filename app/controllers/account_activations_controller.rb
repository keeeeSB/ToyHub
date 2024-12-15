class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      flash[:success] = "アカウント承認が完了しました。"
    else
      flash[:danger] = "無効なリンクです。" 
    end
    redirect_to root_path
  end
end
