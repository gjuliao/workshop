class Event < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    has_many :bookings
    has_many :customers, through: :bookings
    validates :name, :description, presence: true
    validates :start_date, :end_date, :start_time, :end_time, presence: true
    validates :total_sits, :remaining_sits, :registration_fee, presence: true, numericality: true
    validates :end_date, comparison: { greater_than: :start_date, message: 'Can not be before starting date' }

    scope :upcoming_events, -> { where('start_date > ?', Date.today) }
    scope :past_events, -> { where('end_date < ?', Date.today) }

    def total_duration
        "From #{start_date} to #{end_date}"
    end

    def daily_event_hours
        "#{((start_time.to_time - end_time.to_time)/1.hours).abs} hours"
    end

    def daily_duration
        "Everyday #{start_time} to #{end_time} (#{daily_event_hours})"
    end

    def is_upcoming_event?
        start_date > Date.today
    end
end
