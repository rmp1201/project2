class CreateAppointmentsServices < ActiveRecord::Migration
  def change
    create_table :appointments_services do |t|
      t.integer :appointment_id
      t.integer :service_id

    end
  end
end
