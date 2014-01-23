class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  helper_method :current_user_admin?
  helper_method :authenticate_admin

  protect_from_forgery with: :exception

	before_action :set_locale
	 
	def set_locale
	  I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options(options={})
	  logger.debug "default_url_options is passed options: #{options.inspect}\n"
	  { locale: I18n.locale }
	end

	def after_sign_out_path_for(resource_or_scope)
    request.referrer
	end

	def after_sign_in_path_for(resource)
		creatives_path
	end 

  def current_user_admin?
  	current_user.try(:admin?)
  end

  def authenticate_admin
  	redirect_to root_path unless current_user_admin?
  end

end
