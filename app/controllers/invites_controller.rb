class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invites_params)

    if @invite.save
      flash[:notice] = "Invite sent!"
      redirect_to event_path(params[:invite][:invited_event_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy

    flash[:notice] = 'Uninvited!'
    redirect_to :back
  end

  def accept
    @invite = Invite.find(params[:id])
    @invite.destroy

    flash[:notice] = 'Uninvited!'
    redirect_to event_path(params[:id])
  end

  private

  def invites_params
    params.require(:invite).permit(:invitee_id, :invited_event_id)
  end

  def accept_params
    params.require(:invite).permit(:invite_id, :invited_event_id, :accept)
  end
end