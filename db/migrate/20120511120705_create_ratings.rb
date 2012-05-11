class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.references :brand
      t.references :user

      t.timestamps
    end
    add_index :ratings, "brand_id"
    add_index :ratings, "user_id"
  end
end
