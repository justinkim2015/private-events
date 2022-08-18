class EventAttendeesController < ApplicationController
  def create
    # @event_attendee = EventAttendee.new(event_attendees_params)
    @event_attendee = EventAttendee.new

    if @event_attendee.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # private

  def event_attendees_params
    params.require(:event_attendee).permit(:attended_event_id, :attendee_id)
  end
end

# What you have in this branch won't work because of the new_event_attendee_path. This routes
# to the #new action on the corresponding Controller, but you've only defined a #create. You
# need to use the create route. Now it'd be nice if rails had a route called create_resource_path
# but that's not quite how it works, as you can see from the table
# here: https://guides.rubyonrails.org/routing.html#crud-verbs-and-actions

# # Note that the index and create paths are actually the same. The big difference is that
# the index route uses a GET request and the create route uses a POST. This means you need
# to hit event_attendees_path with a POST request in order to create the entity (note that
# buttons POST by default). You'll also need to pass it your strong parameters, or else
# it won't save. You can do this just through passing arguments to the path ie. event_attendees_path(args_here)
# -- although you may need to look back at the Odin lesson or rails guides to understand the syntax
# that strong parameters expects.

# @event_attendee = EventAttendee.new(attended_event_id: event.id, attendee_id: current_user.id)

# work on figuring out the strong params
# What is my post request actually submitting

# for some reaons my EventAttendee is always invalid

# #<EventAttendee:0x0000555b4a3a4648
# id: 1,
# created_at: Tue, 04 Jan 2022 12:12:00.000000000 UTC +00:00,
# updated_at: Tue, 04 Jan 2022 12:12:00.000000000 UTC +00:00,
# attendee_id: 1,
# attended_event_id: 3>
# irb(main):035:0> ea.valid?
# => false
# irb(main):036:0>

# Parameters: {"authenticity_token"=>"[FILTERED]", "event_attendee"=>{"attended_event_id"=>"1", "attendee_id"=>"1"}}
