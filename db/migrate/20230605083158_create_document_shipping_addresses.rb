class CreateDocumentShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :document_shipping_addresses do |t|

      t.timestamps
    end
  end
end
