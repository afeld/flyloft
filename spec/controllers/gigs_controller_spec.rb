require 'spec_helper'

describe GigsController do

  def mock_gig(stubs={})
    @mock_gig ||= mock_model(Gig, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all gigs as @gigs" do
      Gig.stub(:all) { [mock_gig] }
      get :index
      assigns(:gigs).should eq([mock_gig])
    end
  end

  describe "GET show" do
    it "assigns the requested gig as @gig" do
      Gig.stub(:find).with("37") { mock_gig }
      get :show, :id => "37"
      assigns(:gig).should be(mock_gig)
    end
  end

  describe "GET new" do
    it "assigns a new gig as @gig" do
      Gig.stub(:new) { mock_gig }
      get :new
      assigns(:gig).should be(mock_gig)
    end
  end

  describe "GET edit" do
    it "assigns the requested gig as @gig" do
      Gig.stub(:find).with("37") { mock_gig }
      get :edit, :id => "37"
      assigns(:gig).should be(mock_gig)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created gig as @gig" do
        Gig.stub(:new).with({'these' => 'params'}) { mock_gig(:save => true) }
        post :create, :gig => {'these' => 'params'}
        assigns(:gig).should be(mock_gig)
      end

      it "redirects to the created gig" do
        Gig.stub(:new) { mock_gig(:save => true) }
        post :create, :gig => {}
        response.should redirect_to(gig_url(mock_gig))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gig as @gig" do
        Gig.stub(:new).with({'these' => 'params'}) { mock_gig(:save => false) }
        post :create, :gig => {'these' => 'params'}
        assigns(:gig).should be(mock_gig)
      end

      it "re-renders the 'new' template" do
        Gig.stub(:new) { mock_gig(:save => false) }
        post :create, :gig => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested gig" do
        Gig.should_receive(:find).with("37") { mock_gig }
        mock_gig.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :gig => {'these' => 'params'}
      end

      it "assigns the requested gig as @gig" do
        Gig.stub(:find) { mock_gig(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:gig).should be(mock_gig)
      end

      it "redirects to the gig" do
        Gig.stub(:find) { mock_gig(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(gig_url(mock_gig))
      end
    end

    describe "with invalid params" do
      it "assigns the gig as @gig" do
        Gig.stub(:find) { mock_gig(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:gig).should be(mock_gig)
      end

      it "re-renders the 'edit' template" do
        Gig.stub(:find) { mock_gig(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested gig" do
      Gig.should_receive(:find).with("37") { mock_gig }
      mock_gig.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the gigs list" do
      Gig.stub(:find) { mock_gig }
      delete :destroy, :id => "1"
      response.should redirect_to(gigs_url)
    end
  end

end
