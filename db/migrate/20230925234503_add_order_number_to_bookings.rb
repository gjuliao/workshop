class AddOrderNumberToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :order_number, :string
  end
end
