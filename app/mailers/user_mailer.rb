class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = 'https://pickable.herokuapp.com/'
    mail(to: @user.email, subject: '新規登録が完了しました！')
  end
end
