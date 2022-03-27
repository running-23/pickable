class EventsController < ApplicationController
  before_action :set_event, only: %i[edit update destroy]
  skip_before_action :require_login, only: %i[index show]

  def index
    @events = Event.includes([:user,:category]).where(scheduled_date: Time.current..Time.current.since(3.years)).page(params[:page]).per(10)
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
      redirect_to event_path(@event), success: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), success: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy

    redirect_to events_path, success: 'Event was successfully destroyed.'
  end

  private

  def set_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :number_of_members, :number_of_applicants,
                                  :scheduled_date, :place, :pickable_mode, :user_id, :category_id)
  end
end
