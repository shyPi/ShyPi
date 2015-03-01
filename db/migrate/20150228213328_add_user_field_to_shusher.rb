class AddUserFieldToShusher < ActiveRecord::Migration
  def change
    add_reference :shushers, :user, index: true
    add_foreign_key :shushers, :users
  end
end
