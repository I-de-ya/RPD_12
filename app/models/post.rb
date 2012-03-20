class Post < ActiveRecord::Base

	translates :title, :body, :slug#, :fallbacks_for_empty_translations => true
	accepts_nested_attributes_for :translations

	extend FriendlyId
	friendly_id :title, :use => :globalize #:SimpleI18n

	validates :title, :body, :presence => true

	default_scope :order => 'posts.created_at DESC'
end
