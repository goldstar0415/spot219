ActiveAdmin.register Blog do

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
    column :thumb do |blog|
      image_tag(blog.img.url(:thumb), width: '100')
    end
    column :title

    column :body do |blog|
      blog.body.truncate(100)
    end

    column :user
  end

  show do
    attributes_table do
      row :title
      row :user

      row :image do
        image_tag(blog.img.url(:thumb), width: '100')
      end

      row :body do
        raw(blog.body)
      end
    end
  end

 form do |f|
    f.inputs 'Community' do
      f.input :title
      f.input :body, :as => :ckeditor
      f.input :user
      f.input :img
    end

    actions
  end
end
