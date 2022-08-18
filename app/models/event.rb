class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees
  # Optional: true makes rails not check for creators existance

  validates :place, presence: true
  validates :date, presence: true

  def self.past
    self.where("date < ?", Time.now)
  end

  def self.upcoming
    self.where("date > ?", Time.now)
  end
end

