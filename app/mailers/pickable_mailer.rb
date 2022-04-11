class PickableMailer < ApplicationMailer
  default bcc: -> { params[:user].pluck(:email) }

  def report_pickable
    @event = params[:event]
    @url = 'https://pickable.herokuapp.com/'
    mail(subject: 'Pickableされました！')
  end
end
