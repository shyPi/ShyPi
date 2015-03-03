class RemoveShoutMsgColumnFromShusher < ActiveRecord::Migration
  def change
    remove_column :shushers, :shout_msg, :string
  end
end
