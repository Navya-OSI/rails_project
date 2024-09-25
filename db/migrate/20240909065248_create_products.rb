class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :productId
      t.string :productName
      t.text :productDescription

      t.timestamps
    end
  end
end
