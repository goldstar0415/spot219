ActiveAdmin.register Subscription do

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
    column :name
    column :price

    actions
  end

  show do
    attributes_table do
      row :name
      row :price

      panel "Subscription Features" do
        table_for subscription.features do
          column :slug
          column :name
        end
      end
    end
  end

  form do |f|
    f.inputs 'Community' do
      f.input :name
      f.input :price
      # f.input :package, include_blank: false
      hr
      f.inputs 'Features' do
        f.input :feature_ids, as: :check_boxes, collection: Feature.all
      end
      # f.inputs do
      #   f.has_many :features, heading: "Features", allow_destroy: false, new_record: false do |f|
      #     f.input :name
      #     f.input :slug
      #   end
      # end
    end

    actions
  end
end
