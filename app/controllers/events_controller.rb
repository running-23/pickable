class EventsController < ApplicationController
  before_action :set_event, only: %i[edit update destroy]
  skip_before_action :require_login, only: %i[index show]

  def index
    @events =
      Event.preload(:category).eager_load(:participations).from_today.page(params[:page]).per(10)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def edit; end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      current_user.participate(@event)
      redirect_to event_path(@event), success: 'イベントが作成されました。'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), success: 'イベントが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    EventCancelMailer.with(event: @event).event_cancel.deliver_now
    @event.destroy
    redirect_to events_path, success: 'イベントが削除されました。'
  end

  private

  def set_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :number_of_members, :scheduled_date,
                                  :place, :user_id, :category_id)
  end
end
