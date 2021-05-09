class Room < ApplicationRecord
  validates :user_id, {presence: true}

  def self.search_area(search)
    if search
      Room.where(['address LIKE ?', "%#{search}%"])
    else
      Room.all
    end
  end

  def self.search_keyword(search)
    if search
      Room.where(['name LIKE ? OR address LIKE ? OR introduction LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Room.all
    end
  end

end
