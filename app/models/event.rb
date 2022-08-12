class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  # THIS IS THE PROBLEM HERE ^^^ I prob just dont understand
  # the associations well enough

  validates :place, presence: true
  validates :date, presence: true
end
