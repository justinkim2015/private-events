class EventsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def past
    @event = Event.where("date < Time.now")
  end

  def upcoming
    @event = Event.where("date > Time.now")
  end

  private

  def event_params
    params.require(:event).permit(:date, :place)
  end

  def require_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
