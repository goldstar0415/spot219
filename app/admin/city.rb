ActiveAdmin.register City do

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
    column :city_name
    column :first_name
    column :last_name
    column :longitude
    column :latitude
    column :radius
  end

  show do
    attributes_table do
      row :city_name

      row :user
      row :first_name
      row :last_name
      row :email

      row :about

      row :longitude
      row :latitude
      row :radius

      row :places do
        city.places.count
      end

      row :categories do
        city.categories.count
      end

      row :image do
        image_tag(city.image.url, width: 500)
      end
    end

    active_admin_comments
  end

  form do |f|
    f.inputs 'Community' do
      f.input :city_name
      f.input :user
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :about
      f.input :longitude
      f.input :latitude
      f.input :radius
      f.input :image
    end

    actions
  end
end
