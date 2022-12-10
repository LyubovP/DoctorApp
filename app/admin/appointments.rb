ActiveAdmin.register Appointment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
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
