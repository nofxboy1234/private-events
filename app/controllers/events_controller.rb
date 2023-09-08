class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    current_invitees = @event.attendees
    @valid_invitees = User.all.filter_map do |user|
      [user.name, user.id] unless current_invitees.include?(user) ||
                                  user.eql?(current_user)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user

    # @event = Event.new(event_params)

    # @event = @user.events.create(event_params)

    @event = @user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to current_user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to current_user
    # @user = current_user
    # render 'users/show'
  end

  private

  def event_params
    params.require(:event).permit(:location, :date)
  end
end
