ActiveAdmin.register User do
  # Permit necessary fields for the User model
  permit_params :first_name, :last_name, :username, :email, :password, 
                :password_confirmation, :admin, :slug

  # Add filters
  filter :first_name
  filter :last_name
  filter :username
  filter :email
  filter :admin
  filter :created_at
  filter :updated_at

  # Show specific columns on the index page
  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :username
    column :email
    column :admin
    column :created_at
    column :updated_at
    actions
  end

  # Configure form fields for creating/editing users
  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin
    end
    f.actions
  end
end
