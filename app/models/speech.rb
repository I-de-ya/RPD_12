class Speech < ActiveRecord::Base
	belongs_to :user

	validates :title, :organization, :author_name, :presence => true
end