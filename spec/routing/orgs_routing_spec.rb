require "spec_helper"

describe OrgsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/orgs" }.should route_to(:controller => "orgs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/orgs/new" }.should route_to(:controller => "orgs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/orgs/1" }.should route_to(:controller => "orgs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/orgs/1/edit" }.should route_to(:controller => "orgs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/orgs" }.should route_to(:controller => "orgs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/orgs/1" }.should route_to(:controller => "orgs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/orgs/1" }.should route_to(:controller => "orgs", :action => "destroy", :id => "1")
    end

  end
end
