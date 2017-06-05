class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  default_scope { order(price: :asc) }

  def self.search(origin, destination, date)
    where("origin_id = ? AND
           destination_id = ? AND
           departure_date BETWEEN ? AND ?",
           origin, destination,
           date.at_midnight, date.at_end_of_day)
  end
end
