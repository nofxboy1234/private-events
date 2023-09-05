class Event < ApplicationRecord
  # belongs_to :user
  
  has_many :signups, foreign_key: :attended_event_id
  has_many :attendees, through: :signups, source: :event_attendee

  belongs_to :creator, class_name: 'User'
end
