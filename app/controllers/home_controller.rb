class HomeController < ApplicationController
  before_action :authenticate_account!, only: :dashboard

  def index
  end

  def dashboard
  end

  def access_denied
  end

  def record_not_found
    
  end
end
