class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,
         omniauth_providers: [:twitter, :facebook, :google_oauth2, :github]

  serialize :omniauth_raw_data, Hash

  def email_required?
    provider.nil?
  end

  def password_required?
    provider.nil?
  end

  def self.find_or_create_from_twitter(omniauth_data)
    user = User.where(provider: "twitter", uid: omniauth_data["uid"]).first
    unless user
      # create user with Twitter data
      name = omniauth_data["info"]["name"].split #Twitter only returns a name (both first + last) so we need to parse the name field first
      
      user = User.create(provider: "twitter",
                         uid: omniauth_data["uid"],
                         first_name: name[0],
                         last_name: name[1],
                         twitter_consumer_token: omniauth_data["credentials"]["token"],
                         twitter_consumer_secret: omniauth_data["credentials"]["secret"],
                         omniauth_raw_data: omniauth_data
                         )
    end
    user
  end

  def self.find_or_create_from_facebook(omniauth_data)
    user = User.where(provider: "facebook", uid: omniauth_data["uid"]).first
    unless user
      # create user with Facebook data
      user = User.create(provider: "facebook",
                         uid: omniauth_data["uid"],
                         first_name: omniauth_data["info"]["first_name"],
                         last_name: omniauth_data["info"]["last_name"],
                         email: omniauth_data["info"]["email"],
                         facebook_token: omniauth_data["credentials"]["token"],
                         facebook_expires_at: Time.at(omniauth_data["credentials"]["expires_at"]),
                         omniauth_raw_data: omniauth_data
                         )
    end
    user
  end

  def self.find_or_create_from_google_oauth2(omniauth_data)
    user = User.where(provider: "google_oauth2", uid: omniauth_data["uid"]).first
    unless user
      # create user with google_oauth2 data
      google_name = omniauth_data["info"]["name"].split #google_oauth2 only returns a name (both first + last) so we need to parse the name field first      
      user = User.create(provider: "google_oauth2", 
                         uid: omniauth_data["uid"],
                         first_name: google_name[0],
                         last_name: google_name[1],
                         email: omniauth_data["info"]["email"],
                         google_token: omniauth_data["credentials"]["token"],
                         google_expires_at: Time.at(omniauth_data["credentials"]["expires_at"]),
                         omniauth_raw_data: omniauth_data
                         )
    end
    user
  end

  def self.find_or_create_from_github(omniauth_data)
    user = User.where(provider: "github", uid: omniauth_data["uid"]).first
    unless user
      # create user with Github data
      github_name = omniauth_data["info"]["name"].split #google_oauth2 only returns a name (both first + last) so we need to parse the name field first    
      user = User.create(provider: "github",
                         uid: omniauth_data["uid"],
                         first_name: github[0],
                         last_name: github[1],
                         email: omniauth_data["info"]["email"],
                         github_token: omniauth_data["credentials"]["token"],
                         github_expires_at: Time.at(omniauth_data["credentials"]["expires_at"]),
                         omniauth_raw_data: omniauth_data
                         )
    end
    user
  end

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze(" ").strip
    else
      email
    end
  end
  
end