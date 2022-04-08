class PickableMailer < ApplicationMailer
  default bcc: -> {params[:user].pluck(:email)}
  
  def report_pickable
    @url = "https://pickable.herokuapp.com/"
    mail(subject: 'pickableされました！')
  end
end
