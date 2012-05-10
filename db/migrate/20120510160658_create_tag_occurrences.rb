class CreateTagOccurrences < ActiveRecord::Migration
  def change
    create_table :tag_occurrences do |t|
      t.references :brand
      t.references :tag
      t.references :user
      t.timestamps
    end
    add_index :tag_occurrences, ["brand_id", "tag_id"]
    add_index :tag_occurrences, ["user_id", "brand_id"]
    add_index :tag_occurrences, ["user_id", "tag_id"]
  end
end
