class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable, :omniauthable

	has_many :locations
	has_many :votes
	has_many :reviews
	has_many :comments

	# Image uploader using carrierwave
	#mount_uploader :image, ImageUploader

	def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
		data = auth.extra.raw_info
		user = User.where(provider: auth.provider, uid: auth.uid).first
		if user
			return user
		else
			registered_user = User.where(email: data.email).first
			if registered_user
				return registered_user
			else
				user = User.create(first_name: data.first_name,
					last_name: data.last_name,
					gender: data.gender,
					email: data.email,
					password: Devise.friendly_token[0,20],
					provider: auth.provider,
					uid: auth.uid,
					image: auth.info.image,
				)
			end    
		end
	end

	def self.find_for_google_oauth2(auth, signed_in_resource=nil)
		data = auth.extra.raw_info
		user = User.where(provider: auth.provider, uid: auth.uid).first
		if user
			return user
		else
			registered_user = User.where(email: data.email).first
			if registered_user
				return registered_user
			else
				user = User.create(first_name: data.given_name,
					last_name: data.family_name,
					gender: data.gender,
					email: data.email,
					password: Devise.friendly_token[0,20],
					provider: auth.provider,
					uid: auth.uid,
					image: data.picture,
				)
			end
		end
	end

	
end