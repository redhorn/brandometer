class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :value, limit: 30
      t.string :locale, limit: 2

      t.timestamps
    end
    add_index :tags, :value, unique: true
  end
end
