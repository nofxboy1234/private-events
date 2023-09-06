class EventUsersController < ApplicationController
  # def new
  #   @event_user = EventUser.new
  # end

  def attend_event
    @user = current_user
    # @event_user = event.attendees.build(@user)
    
    # binding.pry
    @event = Event.find(params[:event])
    @user.attended_events << @event
    # @event.attendees << @user

    redirect_to events_path
  end

  # private

  # def event_user_params
  #   params.permit(:event)
  # end
end
