ActiveAdmin.register Comment, :as => "AppointmentComment" do

  permit_params :appointment_id, :user_id, :body

  
  filter :appointment_id
  filter :user_id
  filter :created_at
  
  form do |f|
    f.inputs do
      f.input :appointment_id
      f.input :user_id
      li do
        label :body, class: 'trix-editor-label'
        f.rich_text_area :body
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :body do
        div resource.body
      end
    end
  end
  
end
