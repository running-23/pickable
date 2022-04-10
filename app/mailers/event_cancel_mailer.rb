class EventCancelMailer < ApplicationMailer
  before_action :set_event_participating_user
  default bcc: -> { @email }

  def event_cancel
    @url = "https://pickable.herokuapp.com/"
    mail(subject: '参加していたイベントがキャンセルされました')
  end

  private

  def set_event_participating_user
    @event = params[:event]
    @email = @event.participating_users.pluck(:email)
  end
end
