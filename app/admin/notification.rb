ActiveAdmin.register Notification do

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

index do
    selectable_column
    id_column
    column :title
    column :city do |item|
      item.city.try(:name)
    end
  end

  show do
    attributes_table do
      row :title
      row :body

      row :city do
        notification.city.try(:name)
      end
    end

    active_admin_comments
  end

   form do |f|
    f.inputs 'Community' do
      f.input :title
      f.input :body, :as => :ckeditor
      f.input :city, collection: City.all.map {|item| [item.name, item.id]}
    end

    actions
  end
end
