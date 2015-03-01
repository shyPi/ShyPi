class AddOmniauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :twitter_consumer_token, :string
    add_column :users, :twitter_consumer_secret, :string
    add_column :users, :facebook_token, :string
    add_column :users, :facebook_expires_at, :datetime
    add_column :users, :google_token, :string
    add_column :users, :google_expires_at, :datetime
    add_column :users, :github_token, :string
    add_column :users, :github_expires_at, :datetime
    add_column :users, :omniauth_raw_data, :text

    add_index :users, [:provider, :uid]
    # currently the index is set to have unique email
    # addresses which will not allow multiple users with
    # blank emails
    remove_index :users, :email
    add_index :users, :email    
  end
end
