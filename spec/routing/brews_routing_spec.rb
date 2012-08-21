require "spec_helper"

describe BrewsController do
  describe "routing" do

    it "routes to #index" do
      get("/brews").should route_to("brews#index")
    end

    it "routes to #new" do
      get("/brews/new").should route_to("brews#new")
    end

    it "routes to #show" do
      get("/brews/1").should route_to("brews#show", :id => "1")
    end

    it "routes to #edit" do
      get("/brews/1/edit").should route_to("brews#edit", :id => "1")
    end

    it "routes to #create" do
      post("/brews").should route_to("brews#create")
    end

    it "routes to #update" do
      put("/brews/1").should route_to("brews#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/brews/1").should route_to("brews#destroy", :id => "1")
    end

  end
end
