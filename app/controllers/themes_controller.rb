class ThemesController < ApplicationController
  
	def index
		@themes = Theme.all
	end

end
