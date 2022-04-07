class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'ユーザー新規登録が完了しました！')
  end
end
