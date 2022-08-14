class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :event_attendees
  # ^ This is sus

  # Optional: true makes rails not check for creators existance

  validates :place, presence: true
  validates :date, presence: true
end
