class EventAttendeesController < ApplicationController
  def create
    @event_attendee = EventAttendee.new(attended_event_id: event.id, attendee_id: current_user.id)

    if @event_attendee.save
      flash[:notice] = "Invitation sent!"
    else
      flash[:alert] = "Error!"
    end
    redirect_to index
  end

  # private

  # def event_attendees_params
  #   params.require(:event_attendee).permit(:attended_event_id)
  # end
end