ActiveAdmin.register Category do
  permit_params :title, :short_description, :description,
                :position, :meta_title, :meta_description,
                :meta_keywords, :image

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

  form do |f|
    f.inputs 'Category' do
      f.semantic_errors *f.object.errors.keys
      f.input :title
      f.input :description
      f.input :position
      f.input :image, :as => :file
    end
    f.actions
  end


end
