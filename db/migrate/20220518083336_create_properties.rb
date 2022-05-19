class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :user_id
      t.string :title
      t.integer :property_size
      t.string :price
      t.boolean :is_deposit_required

      t.timestamps
    end
    add_index :properties, :user_id
  end
end
