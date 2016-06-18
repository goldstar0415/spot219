ActiveAdmin.register Claim do

  menu label: "Claims"

  filter :first_name
  filter :email
  filter :status

  index do
    column :id
    column :first_name
    column :last_name
    column :email
    column :status
    column :created_at
    column :place

    actions
  end

  show do |ad|
      attributes_table do
        row :id
        row :first_name
        row :last_name
        row :email
        row :phone
        row :place
        row :proof do
          link_to ad.proof.original_filename, ad.proof.url, target: "_blank"
        end
        row :status

      end
   end

  form do |f|
    f.inputs "Claim Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone
      f.input :place
      f.inputs  do
        f.input :proof
        li do
          label "File"
          link_to f.object.proof.original_filename, f.object.proof.url, target: "_blank"
        end
      end
      f.input :status, as: :radio,  collection: Claim.statuses.keys

    end
    f.actions
  end


end
