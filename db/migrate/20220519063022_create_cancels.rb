class CreateCancels < ActiveRecord::Migration[6.0]
  def change
    create_table :cancels do |t|
      t.string :property_id
      t.string :user_id

      t.timestamps
    end
    add_index :cancels, :property_id
    add_index :cancels, :user_id
  end
end
