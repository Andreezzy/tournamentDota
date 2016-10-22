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
  			user.email = auth[:info][:email]
  			user.name = auth[:info][:name]
        user.img = auth[:info][:image]
  		end
  		user.password = Devise.friendly_token[0,20]
  	end
  end
end