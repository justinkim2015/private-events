class EventAttendeesController < ApplicationController
  def show
    @event_attendee = EventAttendee.find(params[:id])
  end

  def index
    @event_attendees = EventAttendee.all
  end

  def create
    @event_attendee = EventAttendee.new(event_attendees_params)

    if @event_attendee.save
      redirect_to event_path(Event.find(params[:id]))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find(params[:id])
    @event_attendee = EventAttendee.find_by(attendee_id: "#{current_user.id}", attended_event_id: "#{event.id}")
    @event_attendee.destroy

    redirect_to event_path(event)
  end

  private

  def event_attendees_params
    params.require(:event_attendee).permit(:attended_event_id, :attendee_id)
  end
end