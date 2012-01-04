# coding: utf-8
module ApplicationHelper

	# Return a title on a per-page basis
	def title
		base_title = "\"РПД-2012\" IX Международный симпозиум по радиационной плазмодинамике"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
end
