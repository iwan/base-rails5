require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #dashboard" do
    it "returns http error 302 when not authenticated" do
      get :dashboard
      expect(response).to have_http_status(302)
    end

    it "returns http success when authenticated" do
      get :dashboard
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #access_denied" do
    it "returns http success" do
      get :access_denied
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #record_not_found" do
    it "returns http success" do
      get :record_not_found
      expect(response).to have_http_status(:success)
    end
  end

end
