class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.string :shout_msg
      t.string :filename

      t.timestamps null: false
    end
  end
end
