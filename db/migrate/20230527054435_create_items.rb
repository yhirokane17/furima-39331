class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item,null: false
      t.text :explanation,null: false
      t.integer :category_id,null: false
      t.integer :status_id,null: false
      t.integer :delivery_price_id,null: false
      t.integer :address_prefecture_id,null: false
      t.integer :delivery_date_id,null: false
      t.integer :price,null: false
       t.references :user,null:false,foreign_key:true
      t.timestamps
    end
  end
end
