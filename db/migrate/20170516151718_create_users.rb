class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, :last_name, :street_address_1, :street_address_2
      t.string :city, :state, :zip, :email, :password
    end
  end
end
