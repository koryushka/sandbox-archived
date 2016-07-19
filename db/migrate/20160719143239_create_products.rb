class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :description
      t.boolean :can_purchase, default: true
      t.boolean :sold_out, default: false

      t.timestamps
    end
  end
end
