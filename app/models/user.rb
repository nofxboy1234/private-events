class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_users, foreign_key: :event_attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_users

  has_many :events, foreign_key: :creator_id, dependent: :destroy
end
