require 'rails_helper'

RSpec.describe Event, type: :request do
    it 'shows an event an event and redirects to' do
        event = Event.create!(
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

        
        get "/events/1"
        expect(response).to render_template(:show)
    end
end