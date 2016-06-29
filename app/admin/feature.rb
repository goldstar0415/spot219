ActiveAdmin.register Feature do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  filter :name

  index do
    selectable_column
    id_column
    column :name
    column :slug

    actions
  end

  show do
    attributes_table do
      row :name
      row :slug
    end
  end

   form do |f|
    f.inputs 'Community' do
      f.input :name
      # f.input :slug
    end

    actions
  end
end
