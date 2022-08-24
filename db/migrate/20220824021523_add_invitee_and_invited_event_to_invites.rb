class AddInviteeAndInvitedEventToInvites < ActiveRecord::Migration[7.0]
  def change
      add_reference :invites, :invitee
      add_reference :invites, :invited_event
  end
end
