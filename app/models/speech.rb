class Speech < ActiveRecord::Base
	belongs_to :user
	belongs_to :theme

	validates :title, :organization, :author_name, :presence => true
end