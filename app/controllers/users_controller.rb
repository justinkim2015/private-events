class UsersController < ApplicationController
  def show
    @allevents = Event.all
    @user = User.find(params[:id])
    @events = []

    @allevents.each do |event|
      if event.creator_id == @user.id
        @events << event.place
      end
    end
  end
end
