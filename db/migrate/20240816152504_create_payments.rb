class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :amount
      t.string :stripe_payment_id

      t.timestamps
    end
  end
end
