class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  helper_method :current_user

  before_action :configure_permitted_parameters, if: :devise_controller?



  def current_ability
    @current_ability ||= Ability.new(current_account)
  end

  def after_sign_in_path_for(account)
    # stored_location_for(account) || dashboard_path
    dashboard_path
  end

  def current_user
    current_account.user
  end

  def current_user_locale
    current_account.user.locale
  rescue
    I18n.default_locale
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to access_denied_url #, alert: exception.message
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to record_not_found_url #, alert: exception.message
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:tos_and_pp])
  end
  
  def set_locale
    loc = params[:locale]
    loc = nil if !I18n.available_locales.map(&:to_s).include?(loc)
    if current_account # user is logged in
      if loc && loc!=current_user_locale
        current_user.update_attribute(:locale, loc)
        I18n.locale = loc || I18n.default_locale
      else
        I18n.locale = loc || session[:locale] || current_user_locale || I18n.default_locale
      end
    else
      # user not logged in
      I18n.locale = loc || session[:locale] || I18n.default_locale
      session[:locale] = I18n.locale
    end
  end
end
