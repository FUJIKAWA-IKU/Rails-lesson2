class Reservation < ApplicationRecord
  validates :user_id, {presence: true}
  validates :room_id, {presence: true}
end
