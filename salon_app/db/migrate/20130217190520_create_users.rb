class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :dob
      t.string :phone_number
      t.string :address1
      t.string :address2
      t.boolean :admin
      t.boolean :employee
      t.integer :lastAppointment

      t.timestamps
    end
  end
end
