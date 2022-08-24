class RenameInvitees < ActiveRecord::Migration[7.0]
  def change
    rename_column :invites, :invitee_id, :invitation_id
  end
end
