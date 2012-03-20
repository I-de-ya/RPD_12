class Theme < ActiveRecord::Base
	has_many :speeches

	translates :title#, :fallbacks_for_empty_translations => true
	accepts_nested_attributes_for :translations
end
