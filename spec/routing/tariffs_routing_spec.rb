require "rails_helper"

RSpec.describe TariffsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tariffs").to route_to("tariffs#index")
    end

    it "routes to #new" do
      expect(:get => "/tariffs/new").to route_to("tariffs#new")
    end

    it "routes to #show" do
      expect(:get => "/tariffs/1").to route_to("tariffs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tariffs/1/edit").to route_to("tariffs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tariffs").to route_to("tariffs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tariffs/1").to route_to("tariffs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tariffs/1").to route_to("tariffs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tariffs/1").to route_to("tariffs#destroy", :id => "1")
    end

  end
end
