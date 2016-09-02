module UsersHelper

  def account_status(account)
    if account.nil?
      content_tag(:span, t('.no_account'), class: "label label-default")
    elsif !account.invitation_sent_at.nil?
      if account.invitation_accepted_at.nil?
        content_tag(:span, t('.invitation_sent'), class: "label label-primary")
      else
        content_tag(:span, t('.invitation_accepted'), class: "label label-success")
      end
    elsif account.sign_in_count>0
      content_tag(:span, t('.has_an_account'), class: "label label-success")
    end    
  end

end
