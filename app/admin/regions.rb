ActiveAdmin.register Region do
  permit_params :name, :description, :user_id, :slug

    # Controller block to check CanCanCan permissions
    controller do
      # Ensure the user has the correct permissions before allowing them to access Region
      before_action :load_and_authorize_resource
  
      # Custom resource finding based on slug
      def find_resource
        scoped_collection.find_by_slug(params[:id])
      end
    end  
  
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :user
    column :slug
    column :created_at
    actions
  end

  filter :name
  filter :description
  filter :user
  filter :created_at

  show do
    attributes_table do
      row :name
      row :description
      row :user
      row :slug
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :user, as: :select, collection: User.all
      f.input :slug
    end
    f.actions
  end
end
