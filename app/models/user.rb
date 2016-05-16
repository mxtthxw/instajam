class User < ActiveRecord::Base
	has_many :posts

	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create
end
