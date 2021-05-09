class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true}
  validates :password, {presence: true}

  def rooms
    return Room.where(user_id: self.id)
  end
end
