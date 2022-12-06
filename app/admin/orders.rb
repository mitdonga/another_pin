ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :email, :phone, :country, :address_1, :address_2, :city, :postal_code, :user_id, :cart_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :email, :phone, :country, :address_1, :address_2, :city, :postal_code, :user_id, :cart_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

	index do 
		selectable_column
		id_column
		column :name do |order|
			order.first_name + " " + order.last_name
		end
		column :order_value do |order|
			"$ #{order.total_value/100}"
		end
		column :email
		column :country
		column :address_1
		column :address_2
		column :city
		column :postal_code
		column :items do |order|
			order.get_items
		end
		actions

	end
  
end
