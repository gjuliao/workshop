# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Creating events'

events = Event.create([
    {
        name: 'Full Stack Event',
        description: 'Invitation for all ruby on rails passionate',
        start_date: Date.today + 2.days,
        end_date: Date.today + 9.days,
        start_time: '10am',
        end_time: '5pm',
        total_sits: 100,
        remaining_sits: 0,
        registration_fee: 100
    },
    {
        name: 'React Event',
        description: 'Invitation for all react passionate',
        start_date: Date.today + 2.days,
        end_date: Date.today + 9.days,
        start_time: '10am',
        end_time: '5pm',
        total_sits: 200,
        remaining_sits: 10,
        registration_fee: 200
    },
    {
        name: 'Python Event',
        description: 'Invitation for all python passionate',
        start_date: Date.today + 2.days,
        end_date: Date.today + 9.days,
        start_time: '10am',
        end_time: '5pm',
        total_sits: 300,
        remaining_sits: 25,
        registration_fee: 300
    }
])


puts 'Events created'
