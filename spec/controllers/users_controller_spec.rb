require 'spec_helper'

describe UsersController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all users as @users" do
      User.stub(:all) { [mock_user] }
      get :index
      assigns(:users).should eq([mock_user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      User.stub(:find).with("37") { mock_user }
      get :show, :id => "37"
      assigns(:user).should be(mock_user)
    end
  end

end
