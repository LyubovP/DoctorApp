ActiveAdmin.register Appointment do
  permit_params :patient_id, :doctor_id, :message

  index do
    selectable_column
    id_column
    column :patient_id
    column :doctor_id
    column :message
    actions
  end
  
  filter :patient_id
  filter :doctor_id
  filter :message
  filter :created_at
  
  form do |f|
    f.inputs do
      f.input :patient_id
      f.input :doctor_id
      f.input :message
    end
    f.actions
  end  
end
