ActiveAdmin.register Order do

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
  filter :status

  index do
    selectable_column
    id_column
    column :total_excluding_tax
    column :tax
    column :total_price
    column :status

    actions
  end

  show do
    attributes_table do
      row :total_excluding_tax
      row :tax
      row :total_price
      row :status
    end

    active_admin_comments
  end

   form do |f|
    f.inputs 'Community' do
      f.input :total_excluding_tax
      f.input :tax
      f.input :total_price
      f.input :status
    end

    actions
  end

end
