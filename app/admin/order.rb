ActiveAdmin.register Order do
  permit_params :phone, :name, :status

  index do
    column :id
    column 'Продукты' do |order|
      raw order.line_items.collect { |line_item| link_to line_item.product.title + " (#{line_item.quantity})", line_item.product }.join(", ")
    end
    column 'Имя', :name
    column 'Телефон', :phone
    column 'Статус', :status
    selectable_column
    actions
  end

  statuses = ['Новый', 'В обработке', 'Отменен']

  form do |f|
    f.inputs 'Order' do
      f.semantic_errors *f.object.errors.keys
      f.input :name
      f.input :phone
      f.input :status , as: :select, collection: statuses, include_blank: false
    end
    f.actions
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
