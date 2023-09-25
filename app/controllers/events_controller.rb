class EventsController < ApplicationController
    def index
        @events = Event.upcoming_events
    end

    def show
        @event = Event.find(params[:id])
    end
end