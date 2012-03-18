require 'file_size_validator'

class Speech < ActiveRecord::Base
	belongs_to :user
	belongs_to :theme

	mount_uploader :thesis, ThesisUploader

	validates :title, :organization, :author_name, :presence => true
	validates :thesis, :file_size => {:maximum => 4.megabytes.to_i}
end