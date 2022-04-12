class BeforeEventStartMailer < ApplicationMailer
  before_action :set_participating_event_user

  default bcc: -> { @email }

  def before_event_start
    @url = Rails.application.credentials.gmail[:url]
    mail(subject: '参加したイベントが開始されます！')
  end

  private

  def set_participating_event_user
    @participating_event_user = User.includes(participations: :event).where(
      events: { scheduled_date: Time.current..2.hours.since }
    )
    @email = @participating_event_user.pluck(:email)
  end
end
