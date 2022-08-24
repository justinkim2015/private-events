class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees

  has_many :invites, foreign_key: :invited_event_id
  has_many :invitees, through: :invites

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

  def self.pretty_date(event)
    p "#{event.date.month}-#{event.date.day}-#{event.date.year}"
  end
end
