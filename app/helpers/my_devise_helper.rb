module MyDeviseHelper
  def links(devise_mapping, controller_name, resource_class)
    btn_classes  = "btn btn-default"
    link_classes = "" # or btn_classes

    arr = []
    if controller_name != 'sessions'
      arr << link_to(t('.sign_in'), new_session_path(resource_name), class: link_classes)
    end
    if devise_mapping.registerable? && controller_name != 'registrations'
      arr << link_to(t('.sign_up'), new_registration_path(resource_name), class: link_classes)
    end
    if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'
      arr << link_to(t('.forgot_your_password'), new_password_path(resource_name), class: link_classes)
    end
    if devise_mapping.confirmable? && controller_name != 'confirmations'
      arr << link_to(t('.conf_instr'), new_confirmation_path(resource_name), class: link_classes)
    end
    if devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks'
      arr << link_to(t('.unlck_instr'), new_unlock_path(resource_name), class: link_classes)
    end
    if devise_mapping.omniauthable?
      resource_class.omniauth_providers.each do |provider|
        arr << link_to(t('.sign_in_with', name: provider.to_s.titleize), omniauth_authorize_path(resource_name, provider), class: link_classes)
      end
    end

    content_tag(:span) do
      arr.join("   ::   ").html_safe
    end
  end

end