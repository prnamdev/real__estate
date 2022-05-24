class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.string :property_id
      t.string :user_id

      t.timestamps
    end
    add_index :interests, :property_id
    add_index :interests, :user_id
    add_index :interests, [:property_id, :user_id], unique: true
  end
end
