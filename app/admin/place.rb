ActiveAdmin.register Place do

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
  filter :subdomain

  index do
    selectable_column
    column "Subdomain" do |c|
      link_to c.subdomain, edit_admin_place_path(c.subdomain)
    end
    column :name
    column :title
    column :title do |place|
      place.title.try(:truncate, 30)
    end
    column :about
    column :address
    column :phone
    column :web
    column :user

    actions
  end

  show do
    attributes_table do
      row :name
      row :title
      row :description
      row :about
      row :country
      row :city
      row :address
      row :phone
      row :fb
      row :twit
      row :insta
      row :web
      row :user
      row :map
      row :subdomain

      row :image do
        image_tag(place.image.url, width: 500)
      end

      panel "Sliders" do
        table_for place.sliders do
          column "Image" do |slider|
            image_tag slider.image.url
          end
        end
      end

      row :reviews do
        place.average_rating
      end
    end

    active_admin_comments
  end

   form do |f|
    f.inputs 'Community' do
      f.input :name
      f.input :about
      f.input :country
      f.input :city_id, collection: City.all.map {|item| [item.city_name, item.id]}, as: :select
      f.input :address
      f.input :phone
      f.input :fb
      f.input :twit
      f.input :insta
      f.input :web
      f.input :user
      f.input :map
      f.input :image
      hr
      f.inputs do
        f.has_many :sliders, heading: "Sliders", allow_destroy: true, new_record: true do |a|
          a.input :image, :as => :file, :label => "Image",:hint => a.object.image.nil? ? a.template.content_tag(:span, "No Image Yet") : a.template.image_tag(a.object.image)
        end
      end
      f.input :subdomain
      hr
      f.input :title, label: "SEO Title"
      f.input :description, label: "SEO Description"
      hr
      f.inputs do
        f.has_many :open_days, heading: "Open Days", allow_destroy: false, new_record: false do |a|
          a.input :day_in_week
          a.input :open, as: :select, include_blank: false
          a.input :start_time, as: :time_select, ampm: true, discard_minute: true, ignore_date: true, include_blank: false
          a.input :end_time, as: :time_select, ampm: true, discard_minute: true, ignore_date: true, include_blank: false
        end
      end
    end

    actions
  end
end
