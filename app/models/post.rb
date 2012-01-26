class Post < ActiveRecord::Base
	validates :title, :presence => true
	validates :body, :presence => true

	default_scope :order => 'posts.created_at DESC'
end
