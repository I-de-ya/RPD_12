class Speech < ActiveRecord::Base
	validates :title, :organization, :author_name, :presence => true
end