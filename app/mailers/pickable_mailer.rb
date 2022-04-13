class PickableMailer < ApplicationMailer
  default bcc: -> { params[:user].pluck(:email) }

  def report_pickable
    @event = params[:event]
    @url = Rails.application.credentials.gmail[:url]
    mail(subject: 'イベントにPickされました！')
  end
end
