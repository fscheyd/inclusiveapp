class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.string :business_type
      t.string :business_address
      t.string :busniess_phone_number

      t.timestamps
    end
  end
end
