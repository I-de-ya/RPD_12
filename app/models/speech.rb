class Speech < ActiveRecord::Base
	validates :title, :organization, :author_name, :phone, :presence => true
end
