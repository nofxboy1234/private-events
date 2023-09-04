class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    # @event = Event.new(event_params)
    @event = @user.events.create(event_params)

    if @event
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:location, :date)
  end
end
