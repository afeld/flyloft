require 'spec_helper'

describe OrgsController do

  def mock_org(stubs={})
    @mock_org ||= mock_model(Org, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all orgs as @orgs" do
      Org.stub(:all) { [mock_org] }
      get :index
      assigns(:orgs).should eq([mock_org])
    end
  end

  describe "GET show" do
    it "assigns the requested org as @org" do
      Org.stub(:find).with("37") { mock_org }
      get :show, :id => "37"
      assigns(:org).should be(mock_org)
    end
  end

  describe "GET new" do
    it "assigns a new org as @org" do
      Org.stub(:new) { mock_org }
      get :new
      assigns(:org).should be(mock_org)
    end
  end

  describe "GET edit" do
    it "assigns the requested org as @org" do
      Org.stub(:find).with("37") { mock_org }
      get :edit, :id => "37"
      assigns(:org).should be(mock_org)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created org as @org" do
        Org.stub(:new).with({'these' => 'params'}) { mock_org(:save => true) }
        post :create, :org => {'these' => 'params'}
        assigns(:org).should be(mock_org)
      end

      it "redirects to the created org" do
        Org.stub(:new) { mock_org(:save => true) }
        post :create, :org => {}
        response.should redirect_to(org_url(mock_org))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved org as @org" do
        Org.stub(:new).with({'these' => 'params'}) { mock_org(:save => false) }
        post :create, :org => {'these' => 'params'}
        assigns(:org).should be(mock_org)
      end

      it "re-renders the 'new' template" do
        Org.stub(:new) { mock_org(:save => false) }
        post :create, :org => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested org" do
        Org.should_receive(:find).with("37") { mock_org }
        mock_org.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :org => {'these' => 'params'}
      end

      it "assigns the requested org as @org" do
        Org.stub(:find) { mock_org(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:org).should be(mock_org)
      end

      it "redirects to the org" do
        Org.stub(:find) { mock_org(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(org_url(mock_org))
      end
    end

    describe "with invalid params" do
      it "assigns the org as @org" do
        Org.stub(:find) { mock_org(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:org).should be(mock_org)
      end

      it "re-renders the 'edit' template" do
        Org.stub(:find) { mock_org(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested org" do
      Org.should_receive(:find).with("37") { mock_org }
      mock_org.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the orgs list" do
      Org.stub(:find) { mock_org }
      delete :destroy, :id => "1"
      response.should redirect_to(orgs_url)
    end
  end

end
