ActiveAdmin.register Shout do

  #allow ActiveAdmin to permit extra params
  permit_params :shout_msg, :filename


  index do
    selectable_column #this provides the checkbox for each shusher
    #id_column
    column "Shout Msg", :shout_msg, :sortable => :shout_msg
    column :filename

    # 'default_actions' is deprecated, use 'actions' instead
    actions  #to show the "view", "edit", "destroy" buttons
  end

  filter :shout_msg
  filter :filename

  form do |f|
    f.inputs "Admin Details" do
      f.input :shout_msg
      f.input :filename
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
