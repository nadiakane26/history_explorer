ActiveAdmin.register Region do
  # Permit the necessary fields for Region model
  permit_params :name, :description, :user_id, :slug

  controller do
    # Custom resource finding based on slug
    def find_resource
      scoped_collection.find_by_slug(params[:id])
    end
  end

  filter :name
  filter :description
  filter :user
  filter :created_at

  # Show specific columns on the index page
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :slug
    actions
  end

  # Configure form fields for creating/editing regions
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :user
      f.input :slug
    end
    f.actions
  end
end
