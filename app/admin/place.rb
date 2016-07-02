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
  # filter :slug

  index do
    selectable_column
    column "Slug" do |c|
      link_to c.slug, edit_admin_place_path(c)
    end
    column :name
    # column :tagline
    column :tagline do |place|
      place.tagline.try(:truncate, 24)
    end
    column :about do |place|
      place.about.try(:truncate, 24)
    end
    column :address
    column :phone
    column :web
    column :city
    column :owner

    actions
  end

  show do
    attributes_table do
      row :name
      row :tagline
      row :about
      row :city
      row :address
      row :phone
      row :facebook
      row :twitter
      row :instagram
      row :web
      row :owner
      row :slug
      row :lat
      row :lng

      row :image do
        image_tag(place.image, width: 500)
      end

      panel "Sliders" do
        table_for place.sliders do
          column "Image" do |slider|
            image_tag slider.image.url
          end
        end
      end

      row :days do
        raw(place.open_days.map do |open_day|
          ("<strong>#{open_day.day_in_week}</strong>" + " #{open_day.start_time.strftime("%I%p")}-#{open_day.end_time.strftime("%I%p")}")
        end.join('<br/>'))
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
      f.input :about, as: :ckeditor
      f.input :city
      f.input :address
      f.input :phone
      f.input :facebook
      f.input :twitter
      f.input :instagram
      f.input :web
      f.input :owner
      f.inputs do
        f.gmap_coordinate_picker lat_column: 'lat', lng_column: 'lng' , zoom_level: 12, default_coordinates: [cookies[:latitude] || f.object.lat || '9.9333', cookies[:longitude] || f.object.lng || '-84.0833'], map_width: 800
      end
      f.input :image
      hr
      f.inputs do
        f.has_many :sliders, heading: "Sliders", allow_destroy: true, new_record: true do |a|
          a.input :image, as: :file, label: "Image", hint: a.object.image.nil? ? a.template.content_tag(:span, "No Image Yet") : a.template.image_tag(a.object.image)
        end
      end
      f.input :slug
      f.input :tagline, label: "SEO Title"
      # f.input :description, label: "SEO Description"

      f.inputs do
        f.object.add_open_days
        f.has_many :open_days, heading: "Open Days", allow_destroy: false, new_record: false do |a|
          a.input :day_in_week
          a.input :start_time, as: :time_select, ampm: true, discard_minute: true, ignore_date: true, include_blank: false
          a.input :end_time, as: :time_select, ampm: true, discard_minute: true, ignore_date: true, include_blank: false
        end
      end
    end

    actions
  end
end
