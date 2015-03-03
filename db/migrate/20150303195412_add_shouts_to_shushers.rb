class AddShoutsToShushers < ActiveRecord::Migration
  def change
    add_reference :shushers, :shout, index: true
    add_foreign_key :shushers, :shouts
  end
end
