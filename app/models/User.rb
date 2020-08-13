class User < ApplicationRecord
	validates_presence_of :name, :login
	has_secure_password
end
