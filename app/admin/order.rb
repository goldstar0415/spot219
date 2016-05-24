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
      row "Total (excluding tax)" do |order|
        "$#{order.total_excluding_tax}"
      end

      row "Tax" do |order|
        "$#{order.tax}"
      end

      row "Total Price" do |order|
        "$#{order.total_price}"
      end
      row :status
      panel "Order Details" do
        table_for order.order_details do
          column "Place Name" do |order_detail|
            order_detail.place.name
          end
          column :quantity
          column "Price" do |order_detail|
            "$#{order_detail.price}"
          end
          column "Tax" do |order_detail|
            "$#{order_detail.tax}"
          end
          column "Sub Total" do |order_detail|
            "$#{order_detail.sub_total}"
          end
        end
      end

      panel "Order Infos" do
        table_for order.order_info do
          column "First Name" do |order_info|
            order_info.first_name
          end
          column "Last Name" do |order_info|
            order_info.last_name
          end

          column "Company" do |order_info|
            order_info.company
          end

          column "Email" do |order_info|
            order_info.email
          end

          column "Phone" do |order_info|
            order_info.phone
          end
        end
      end

      panel "Billing Address" do
        table_for order.billing_address do
          column "Line" do |billing_address|
            billing_address.line
          end

          column "City" do |billing_address|
            billing_address.city
          end

          column "Country" do |billing_address|
            billing_address.country
          end

          column "PostCode" do |billing_address|
            billing_address.postcode
          end

          column "Country Code" do |billing_address|
            billing_address.country_code
          end
        end
      end
      if order.delivery_address.present?
        panel "Delivery Address" do
          table_for order.delivery_address do
            column "Name" do |delivery_address|
              delivery_address.name
            end

            column "Line" do |delivery_address|
              delivery_address.line
            end

            column "City" do |delivery_address|
              delivery_address.city
            end

            column "Country" do |delivery_address|
              delivery_address.country
            end

            column "PostCode" do |delivery_address|
              delivery_address.postcode
            end

            column "Country Code" do |delivery_address|
              delivery_address.country_code
            end
          end
        end
      end
    end

  end

   form do |f|
    f.inputs 'Community' do
      f.input :total_excluding_tax, :input_html => { :readonly => true }
      f.input :tax, :input_html => { :readonly => true }
      f.input :total_price, :input_html => { :readonly => true }
      f.input :status
      # hr
      # f.inputs do
      #   f.has_many :order_details, heading: "Order Details", allow_destroy: false, new_record: false do |o|
      #     o.input :place_id
      #     o.input :quantity
      #     o.input :price
      #     o.input :tax
      #     o.input :sub_total
      #   end
      # end
    end

    actions
  end

end
