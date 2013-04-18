class CreateAppointments_Services < ActiveRecord::Migration
  def change
    create_table :appointments_services do |t|
      t.integer :appointment_id
      t.integer :service_id
      t.float :timeslot
      t.integer :timeframe


      t.timestamps
    end
  end
end
