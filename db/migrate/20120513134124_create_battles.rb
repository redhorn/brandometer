class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :loser
      t.integer :winner
      t.references :user

      t.timestamps
    end
    add_index :battles, :loser
    add_index :battles, :winner
    add_index :battles, "user_id"
  end
end
