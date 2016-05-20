ActiveAdmin.register User do
  menu label: "Users"

  filter :email
  filter :roles


  index do
    column "ID" do |user|
      link_to user.id, admin_user_path(user)
    end
    column :email
    column :sign_in_count
    column :created_at
    column :roles do |user|
      user.roles.collect {|c| c.name.capitalize }.to_sentence
    end
    actions
  end

  show do |ad|
      attributes_table do
        row :id
        row :email
        row :roles do |user|
          user.roles.collect {|r| r.name.capitalize }.to_sentence
        end
      end
   end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :role_ids, collection: Role.global.map {|item| [(t "simple_form.options.user.roles.#{item.name}"), item.id]}, include_blank: false
    end
    f.actions
  end

  controller do
    def update
      params[:user].each{|k,v| resource.send("#{k}=",v)}
      super
    end

    def permitted_params
      params.permit user: [:email, :role_ids]
    end
  end


end
