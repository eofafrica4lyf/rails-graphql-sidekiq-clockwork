class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :email
      t.string :city

      t.timestamps
    end
  end
end
