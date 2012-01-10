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

	def language_selector
		if I18n.locale == :ru
			link_to "English version", url_for(:locale => 'en')
		else
			link_to "Русская версия", url_for(:locale => 'ru')
		end
	end
end
