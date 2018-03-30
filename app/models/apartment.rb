class Apartment < ApplicationRecord
  belongs_to :resort

  # find apartment by :room_type
  scope :by_room_type, -> (room_type) { where(room_type: room_type) }
end
