class AddPersonalDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dateofbirth, :date
    add_column :users, :gender, :integer
    add_column :users, :zipcode, :string
    add_column :users, :country_id, :integer
  end
end
