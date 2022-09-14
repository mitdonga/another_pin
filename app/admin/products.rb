ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :image_1, :image_2, :image_3, :image_4, :image_5, :price, :is_featured, :collection_date, :description, :is_sold_out

	index do 
		selectable_column
		index_column
		column "Main Image" do |product|
			image_tag product.image_1.thumb.url, width: "100"
		end
		column :title
		column :price
		column :is_featured
		column :is_sold_out
		actions
	end

	form do |f|
		f.inputs "Product info" do
			f.input :title
			f.input :price
			f.input :description
			f.input :collection_date
		end

		f.inputs "Filters" do
			f.input :is_featured, label: "Featured Product On Home Page?"
			f.input :is_sold_out, label: "Is This Product Sold Out?"
		end

		f.inputs "Images" do
			f.input :image_1
			f.input :image_2
			f.input :image_3
			f.input :image_4
			f.input :image_5
		end

		f.actions
	end

	# show do 
	# 	h1 product.title
	# 	h2 product.description
	# 	# div do
	# 	span	image_tag product.image_1.thumb.url
	# 	# end
	# 	div do
	# 		image_tag product.image_2.thumb.url unless product.image_2.blank?
	# 	# end
	# 		# image_tag product.image_3.thumb.url unless product.image_3.blank?
	# 		# image_tag product.image_4.thumb.url unless product.image_4.blank?
	# 		# image_tag product.image_5.thumb.url unless product.image_5.blank?
	# 	end
	# 	# attributes_table do
  #   #   row :title
  #   #   row :image_tag img.image.thumb.url
  #   # end
	# end

  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :image_1, :image_2, :image_3, :image_4, :image_5, :price, :is_featured, :collection_date, :description, :is_sold_out]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
