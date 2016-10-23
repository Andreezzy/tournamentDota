class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
          :omniauth_providers => [:facebook]
  include PermissionsConcern

  def self.from_omniauth(auth)
  	where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
  		if auth[:info]
  			user.email = if auth[:info][:email].nil? then "#{auth[:info][:name]}@gmail.com" else auth[:info][:email] end
        user.first_name = auth[:info][:first_name]
        user.last_name = auth[:info][:last_name]
  			user.name = auth[:info][:name]
        user.image = auth[:info][:image]
  		end
  		user.password = Devise.friendly_token[0,20]
  	end
  end
end
