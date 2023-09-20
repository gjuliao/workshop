class Customer < ApplicationRecord
    validates :full_name, :contact_number, presence: true
    validates :email, presence: true, uniqueness: true
end
