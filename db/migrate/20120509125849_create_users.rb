class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, size: 100
      t.string :email, size: 70, default: "", null: false
      t.string :password_digest
      t.string :remember_token
      t.integer :auth_level, default: 1

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end
