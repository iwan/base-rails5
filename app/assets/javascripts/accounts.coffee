class AccountsController
  new: ->
    console.log "AAaaaaaaaa"
    $('#account_password').strengthMeter('progressBar', 
      container: $('#progress-bar-container')
    )

this.BaseRails5.devise_invitable_registrations = new AccountsController
this.BaseRails5.registrations = new AccountsController
