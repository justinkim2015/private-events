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

    flash[:alert] = 'Invite deleted!'
    redirect_back(fallback_location: root_path)
  end

  def accept
    @invite = Invite.find(params[:invite][:invite_id])
    EventAttendee.create(attended_event_id: params[:invite][:invited_event_id], attendee_id: current_user.id)
    @invite.destroy

    flash[:notice] = 'Accepted!'
    redirect_to event_path(params[:invite][:invited_event_id])
  end

  private

  def invites_params
    params.require(:invite).permit(:invitee_id, :invited_event_id, :invite_id)
  end
end