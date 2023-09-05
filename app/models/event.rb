class Event < ApplicationRecord
  # belongs_to :user
  
  has_many :event_users, foreign_key: :attended_event_id
  has_many :attendees, through: :event_users, source: :event_attendee

  belongs_to :creator, class_name: 'User'
end
