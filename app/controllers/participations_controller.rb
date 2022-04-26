class ParticipationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    current_user.participate(event)
    redirect_to event, success: t('.success')
  rescue ActiveRecord::RecordInvalid
    redirect_to event, danger: t('.fail')
  end

  def destroy
    event = Event.find(params[:event_id])
    current_user.cancel(event)
    redirect_to event, success: t('.success')
  end
end
