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

    # redirect_to events_path

    redirect_to @event
    # render 'events/show'
  end

  def unattend_event
    @user = current_user

    @event = Event.find(params[:event])
    @user.attended_events.delete(@event)

    redirect_to @event
  end

  def invite
    # binding.pry
    @user = User.find(params[:invite_user])
    @event = Event.find(params[:event])
    puts "invite #{@user.name} to this event"
    @event.attendees << @user

    redirect_to @event
  end

  # private

  # def event_user_params
  #   params.permit(:event)
  # end
end
