ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :ip_address, :password, :password_confirmation

  index do
    selectable_column #this provides the checkbox for each user
    #id_column
    column :email
    column :first_name
    column :last_name
    column :ip_address
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :provider
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :ip_address
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :provider

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :ip_address, as: :string
      f.input :password
      f.input :password_confirmation
      f.input :provider
    end
    f.actions
  end

  sidebar :help do
    "Need help? Email us at help@example.com"
  end

end
