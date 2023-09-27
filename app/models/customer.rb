class Customer < ApplicationRecord
    has_many :refunds
    has_many :bookings
    has_many :events, through: :bookings
    validates :full_name, :contact_number, presence: true
    validates :email, presence: true, uniqueness: true

    def self.ransackable_associations(auth_object = nil)
        ["bookings", "events", "refunds"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["contact_number", "created_at", "email", "full_name", "id", "stripe_customer_id", "updated_at"]
    end
end
