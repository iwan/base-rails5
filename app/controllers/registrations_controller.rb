class RegistrationsController < Devise::RegistrationsController
  protected

  # https://github.com/plataformatec/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-up-(registration)
  def after_sign_up_path_for(account)
    edit_user_path account.user
  end

  # def after_inactive_sign_up_path_for(resource)
  #   '/an/example/path' # Or :prefix_to_your_route
  # end

end