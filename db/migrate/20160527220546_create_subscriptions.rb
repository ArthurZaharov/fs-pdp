class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, null: false, index: true
      t.integer :author_id, null: false, index: true
      t.date :expired_at, null: false

      t.timestamps
    end
  end
end
