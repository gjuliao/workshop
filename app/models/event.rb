class Event < ApplicationRecord
    validates :name, :description, presence: true
    validates :start_date, :end_date, :start_time, :end_time, presence: true
    validates :total_sits, :remaining_sits, :registration_fee, presence: true
end
