class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :user,null: false,foreign_key: true
      t.string :number,null: false
      t.integer :address_prefecture_id,null: false
      t.string :address_city,null: false
      t.string :address_number,null: false
      t.string :address_building
      t.string :telephone,null: false

      t.timestamps
    end
  end
end
