class Post < ActiveRecord::Base
	validates :title, :body, :presence => true

	default_scope :order => 'posts.created_at DESC'
end
