class Booking < ApplicationRecord
  has_many :passengers, inverse_of: :booking
  belongs_to :flight
  accepts_nested_attributes_for :passengers

  validates :flight_id, presence: true
end
