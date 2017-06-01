class Passenger < ApplicationRecord
  belongs_to :booking

  validates :first_name, :last_name, :email, presence: true
end
