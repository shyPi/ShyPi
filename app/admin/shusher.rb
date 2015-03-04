ActiveAdmin.register Shusher do
  controller do
    def permitted_params
      params.permit shusher: [:name, :sound_threshold, :shout_id, :mac_address, :user_id]
    end
  end

  index do
    selectable_column #this provides the checkbox for each shusher
    #id_column
    column "Shusher profile", :name, :sortable => :name
    column :sound_threshold
    column "Shout Msg", :shout_id, :sortable => :shout_id do |shusher|
      shusher.shout.shout_msg
    end
    column :mac_address
    column "User name", :user_id, :sortable => :user_id do |shusher|
      shusher.user.first_name
    end

    # 'default_actions' is deprecated, use 'actions' instead
    actions  #to show the "view", "edit", "destroy" buttons
  end

  filter :name
  filter :sound_threshold
  filter :shout_id
  filter :mac_address
  filter :user_id

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :sound_threshold
      f.input :shout_id
      f.input :mac_address, as: :string
      f.input :user_id
    end
    f.actions
  end

  sidebar :help do
    "Need help? Email us at help@example.com"
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
