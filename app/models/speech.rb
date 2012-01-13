class Speech < ActiveRecord::Base
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :title, :organization, :author_name, :presence => true

	validates :email, :format => {:with => email_regex}
end