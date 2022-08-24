class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invites_params)

    if @invite.save
      flash[:notice] = "Invite sent!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def invites_params
    params.require(:invite).permit(:invitee_id, :invited_event_id)
  end
end