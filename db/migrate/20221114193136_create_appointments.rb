class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.bigint :patient_id
      t.bigint :doctor_id
      t.integer :status, default: 0
      t.time :start_time
      t.time :end_time
      t.text :message

      t.timestamps
    end
  end
end
