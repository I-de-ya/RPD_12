class Post < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, :use => :SimpleI18n

	validates :title, :body, :presence => true

	translates :title, :body
	accepts_nested_attributes_for :translations

	default_scope :order => 'posts.created_at DESC'
end
