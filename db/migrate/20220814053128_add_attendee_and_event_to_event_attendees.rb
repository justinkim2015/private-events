class AddAttendeeAndEventToEventAttendees < ActiveRecord::Migration[7.0]
  def change
    add_reference :event_attendees, :attendee
    add_reference :event_attendees, :attended_event
  end
end
