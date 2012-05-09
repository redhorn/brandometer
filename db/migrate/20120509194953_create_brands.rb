class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :uid
      t.boolean :active, default: true
      t.boolean :collecting, default: true
      t.integer :elo, default: 1500
      t.float :wr

      t.timestamps
    end
    add_index :brands, :uid, unique: true
  end
end
