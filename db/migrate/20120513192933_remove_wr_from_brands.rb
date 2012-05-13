class RemoveWrFromBrands < ActiveRecord::Migration
  def up
    remove_column :brands, :wr
  end

  def down
    add_column :brands, :wr, :float
  end
end
