require "rails_helper"

RSpec.describe HomeController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/index").to route_to("home#index")
    end
    it "routes to #terms_of_service" do
      expect(:get => "/terms_of_service").to route_to("home#terms_of_service")
    end
    it "routes to #privacy_policy" do
      expect(:get => "/privacy_policy").to route_to("home#privacy_policy")
    end

    it "routes to #dashboard" do
      expect(:get => "/dashboard").to route_to("home#dashboard")
    end
    it "routes to #access_denied" do
      expect(:get => "/access_denied").to route_to("home#access_denied")
    end
    it "routes to #record_not_found" do
      expect(:get => "/record_not_found").to route_to("home#record_not_found")
    end
  end
end
