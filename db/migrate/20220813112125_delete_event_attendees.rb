class DeleteEventAttendees < ActiveRecord::Migration[7.0]
  def change
    drop_table :event_attendees
  end
end
