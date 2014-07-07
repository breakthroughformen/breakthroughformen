class AddStripeCustomerIdAndTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_customer_id, :string
    add_column :users, :stripe_token, :string
  end
end
