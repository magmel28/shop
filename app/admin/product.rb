ActiveAdmin.register Product do
  permit_params :title, :description, :image, :price, :category_id


  index do
    column :id
    column 'image' do |product|
      image_tag product.image_url(:small) if product.image?
    end
    column 'Название', :title
    actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
