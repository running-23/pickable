class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = "https://pickable.herokuapp.com/"
    mail(to: @user.email, subject: 'ユーザー新規登録が完了しました！')
  end
end
