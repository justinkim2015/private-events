class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees
  # Optional: true makes rails not check for creators existance

  validates :place, presence: true
  validates :date, presence: true


  def self.past
    self.where(self < Time.now)
  end

  def self.upcoming
    self.where(:date > Time.now)
  end
end 

# I probably have to use the ? here to pass in the events
# specific times
# Continue from here, date is not being recognized so I need to figure that out.
