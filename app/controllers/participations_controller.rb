class ParticipationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    current_user.participate(event)
    redirect_to event, success: '参加表明しました'
  rescue ActiveRecord::RecordInvalid
    redirect_to event, danger: '開催希望人数を超えています'
  end

  def destroy
    event = Event.find(params[:event_id])
    current_user.cancel(event)
    redirect_to event, success: '参加をキャンセルしました'
  end
end
