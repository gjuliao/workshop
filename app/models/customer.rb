class Customer < ApplicationRecord
    has_many :refunds
    has_many :bookings
    has_many :events, through: :bookings
    validates :full_name, :contact_number, presence: true
    validates :email, presence: true, uniqueness: true
end
