class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :set_locale

  def default_url_options(options={})
  	logger.debug "default_url_options is passed options: #{options.inspect}\n"
  	{ :locale => I18n.locale }
  end

	protected
		# Set the locale from parameters
		def set_locale
			I18n.locale = params[:locale] unless params[:locale].blank?
		end
end
