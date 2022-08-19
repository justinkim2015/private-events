class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees
  # Optional: true makes rails not check for creators existance

  validates :place, presence: true
  validates :date, presence: true

  # def self.upcoming
  #   where("date > ?", Time.zone.now)
  # end

  # def self.past
  #   where("date < ?", Time.zone.now)
  # end

  scope :upcoming, -> { where("date > ?", Time.now) }
  scope :past, -> { where("date < ?", Time.now) }
end
