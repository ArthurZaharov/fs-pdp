class AddChargeToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :charge_id, :string
  end
end
