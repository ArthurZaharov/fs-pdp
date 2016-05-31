class AddSubscriptionPricesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscription_prices, :jsonb
  end
end
