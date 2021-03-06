module ControllerMacros
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  #   end
  # end

  # def login_user
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:user]
  #     user = FactoryGirl.create(:user)
  #     user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
  #     sign_in user
  #   end
  # end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:account]
      account = FactoryGirl.create(:account)
      begin
        account.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      rescue NoMethodError => e
      end
      sign_in account
    end
  end
  alias login_account login_user

  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:account]
      account = FactoryGirl.create(:account)
      begin
        account.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      rescue NoMethodError => e
      end
      sign_in account
      account.user.admin! # set user as admin
    end
  end

end
