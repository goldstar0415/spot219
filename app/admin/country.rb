ActiveAdmin.register Country do

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
    column "Slug" do |c|
      link_to c.slug, edit_admin_country_path(c)
    end
    column :name
  end

  show do
    attributes_table do
      row :name

      row :places do
        country.cities.count
      end

      row :slug
    end

    active_admin_comments
  end

  form(html: { multipart: true }) do |f|
    f.inputs 'Community' do
      f.input :name
      f.input :slug
    end

    actions
  end
end
