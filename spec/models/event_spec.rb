require 'rails_helper'

RSpec.describe Event, type: :model do
    
    it 'always have presence of name' do
        event = Event.new(
            description: 'This is a javascript event',
            start_date: Date.today - 2.days,
            end_date: Date.today + 2.days,
            start_time: '10am',
            end_time: '5pm',
            total_sits: 100,
            remaining_sits: 100,
            registration_fee: 100
        )
     
        expect(event.valid?).to be(false)
    end

    it 'validates start date is before end date' do
        event = Event.new(
            name: 'Javascript',
            description: 'This is a javascript event',
            start_date: Date.today + 2.days,
            end_date: Date.today - 2.days,
            start_time: '10am',
            end_time: '5pm',
            total_sits: 100,
            remaining_sits: 100,
            registration_fee: 100
        )
       
        expect(event.valid?).to be(false)
    end

    it 'validates total duration' do
        event = Event.new(
            name: 'Javascript',
            description: 'This is a javascript event',
            start_date: Date.today - 2.days,
            end_date: Date.today + 2.days,
            start_time: '10am',
            end_time: '5pm',
            total_sits: 100,
            remaining_sits: 100,
            registration_fee: 100
        )
        
        expect(event.total_duration).to eq("From #{event.start_date} to #{event.end_date}")
    end

    it 'validates daily event hours' do
        event = Event.new(
            name: 'Javascript',
            description: 'This is a javascript event',
            start_date: Date.today - 2.days,
            end_date: Date.today + 2.days,
            start_time: '10am',
            end_time: '5pm',
            total_sits: 100,
            remaining_sits: 100,
            registration_fee: 100
        )
        
        expect(event.daily_event_hours).to eq("#{((event.start_time.to_time - event.end_time.to_time)/1.hours).abs} hours")
    end
    
end