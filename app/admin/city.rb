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
  filter :name
  filter :slug

  index do
    selectable_column
    column "Slug" do |c|
      link_to c.slug, edit_admin_city_path(c)
    end
    column :name
    column :lat
    column :lng
    # column :radius
  end

  show do
    attributes_table do
      row :name

      row :user

      row :about

      row :lng
      row :lat
      # row :radius

      row :places do
        city.places.count
      end

      row :categories do
        city.categories.count
      end

      row :image do
        image_tag(city.image.url, width: 500)
      end

      row :slug
    end

    active_admin_comments
  end

  form(html: { multipart: true }) do |f|
    f.inputs 'Community' do
      f.input :country
      f.input :name
      f.input :user
      f.input :about
      f.input :lng
      f.input :lat
      # f.input :radius
      f.input :image
      f.input :slug
    end

    actions
  end
end
