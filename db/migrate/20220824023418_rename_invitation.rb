class RenameInvitation < ActiveRecord::Migration[7.0]
  def change
    rename_column :invites, :invitation_id, :invitee_id
  end
end
