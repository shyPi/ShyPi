class AddFirstLastNameColumnToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :first_name, :string, null: false, default: ""
    add_column :admin_users, :last_name, :string, null: false, default: ""
  end
end
