class EventCancelMailer < ApplicationMailer
  before_action :set_participating_event_user
  default bcc: -> { @email }

  def event_cancel
    @url = Rails.application.credentials.gmail[:url]
    mail(subject: '参加していたイベントの開催が中止されました')
  end

  private

  def set_participating_event_user
    @event = params[:event]
    @email = @event.participating_users.pluck(:email)
  end
end
