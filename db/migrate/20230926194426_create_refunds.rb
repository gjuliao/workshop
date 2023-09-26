class CreateRefunds < ActiveRecord::Migration[7.0]
  def change
    create_table :refunds do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      t.integer :no_of_tickets
      t.string :state
      t.string :stripe_refund_id
      t.boolean :is_partial_refund
      t.float :amount_refunded

      t.timestamps
    end
  end
end
