# Preview all emails at http://localhost:3000/rails/mailers/bookings_mailer
class BookingsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/bookings_mailer/booking_confirmation
  def booking_confirmation
    BookingsMailer.booking_confirmation
  end

end
