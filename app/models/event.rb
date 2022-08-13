class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  # has_many :attendees, through: :event_attendees, source: :
  # THIS IS THE PROBLEM HERE ^^^ I prob just dont understand
  # the associations well enough

  # Optional: true makes rails not check for creators existance

  validates :place, presence: true
  validates :date, presence: true
end
