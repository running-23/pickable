class EventCancelMailer < ApplicationMailer
  before_action :set_participating_event_user
  default bcc: -> { @email }

  def event_cancel
    @url = "https://pickable.herokuapp.com/"
    mail(subject: '参加していたイベントがキャンセルされました')
  end

  private

  def set_participating_event_user
    @event = params[:event]
    @email = @event.participating_users.pluck(:email)
  end
end
