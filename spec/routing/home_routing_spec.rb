require "rails_helper"

RSpec.describe HomeController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/home/index").to route_to("home#index")
    end

    it "routes to #dashboard" do
      expect(:get => "/home/dashboard").to route_to("home#dashboard")
    end
    it "routes to #access_denied" do
      expect(:get => "/home/access_denied").to route_to("home#access_denied")
    end
    it "routes to #record_not_found" do
      expect(:get => "/home/record_not_found").to route_to("home#record_not_found")
    end
  end
end
