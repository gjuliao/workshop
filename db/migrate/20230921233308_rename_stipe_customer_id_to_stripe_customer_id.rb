class RenameStipeCustomerIdToStripeCustomerId < ActiveRecord::Migration[7.0]
  def change
    rename_column :customers, :stipe_customer_id, :stripe_customer_id
  end
end
