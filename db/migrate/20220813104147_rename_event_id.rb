class RenameEventId < ActiveRecord::Migration[7.0]
  def change
    rename_column :event_attendees, :event_id, :attended_event_id
  end
end
