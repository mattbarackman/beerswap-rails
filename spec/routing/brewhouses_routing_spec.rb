require "spec_helper"

describe BrewhousesController do
  describe "routing" do

    it "routes to #index" do
      get("/brewhouses").should route_to("brewhouses#index")
    end

    it "routes to #new" do
      get("/brewhouses/new").should route_to("brewhouses#new")
    end

    it "routes to #show" do
      get("/brewhouses/1").should route_to("brewhouses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/brewhouses/1/edit").should route_to("brewhouses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/brewhouses").should route_to("brewhouses#create")
    end

    it "routes to #update" do
      put("/brewhouses/1").should route_to("brewhouses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/brewhouses/1").should route_to("brewhouses#destroy", :id => "1")
    end

  end
end
