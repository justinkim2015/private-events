class EventsController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @invites = Invite.where("invited_event_id = ?", @event.id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id

    # @event = current_user.attending_events.build(event_params)

    if @event.save
      flash[:notice] = 'Successfully created!'
      EventAttendee.create(attendee_id: current_user.id, attended_event_id: @event.id)
      redirect_to @event
    else
      flash.now[:alert] = "Oh no! Something went wrong!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:notice] = 'Successfully updated!'
      redirect_to @event
    else
      flash.now[:alert] = "Oh no! Something went wrong!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    flash[:notice] = 'Successfully deleted!'
    redirect_to root_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:date, :place, :title, :body)
  end
end
