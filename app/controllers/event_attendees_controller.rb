class EventAttendeesController < ApplicationController
  def new
    @event_attendee = EventAttendee.new
  end

  def create
    @event_attendee = EventAttendee.new
    @event_attendee.attendee_id = current_user.id
    @event_attendee.attended_event_id = params[:id]

    if @event_attendee.save
      redirect_to index
    else
      render :new, status: :unprocessable_entity
    end
  end

  # private

  # def event_attendees_params
  #   params.require(:event_attendee).permit(:attended_event_id)
  # end
end