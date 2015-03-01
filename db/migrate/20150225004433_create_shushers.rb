class CreateShushers < ActiveRecord::Migration
  def change
    create_table :shushers do |t|
      t.string :name
      t.integer :sound_threshold
      t.string :shout_msg
      t.macaddr :mac_address
      t.inet :ip_address
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end