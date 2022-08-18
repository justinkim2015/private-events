class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, source: :user
  # Optional: true makes rails not check for creators existance

  # validates :place, presence: true
  # validates :date, presence: true
end
