require 'rails_helper'

RSpec.describe SessionController, type: :controller do


  describe 'GET #create' do
    context "when omniauth returns valid hash" do
      before(:each) do
        mock_auth_hash
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
      end

      subject { post :create, provider: :github }

      specify { expect(subject.status).to eq 302 or 301 }

      it "should successfully create a new user" do
        expect{ subject }.to change{ User.count }.by(1)
      end

      it "should create a new session" do
        session[:user_id].should be_nil
        subject
        session[:user_id].should_not be_nil
      end

      it "should create a new session token" do
        session[:session_token].should be_nil
        subject
        session[:session_token].should_not be_nil
      end
    end

    context "when user information is invalid" do
      before do 
        post :create, provider: :github
      end

      it "should not create a user" do
        expect{ subject }.to change{ User.count }.by(0)
      end

      it "should flash error" do
        expect(flash[:error]).to be_present
      end

      it "should redirect to root page" do
        response.should redirect_to root_url
      end
    end
  end

  describe 'GET #destroy' do
    before do 
      mock_auth_hash
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
      post :create, provider: :github
    end

    subject { delete :destroy }

    it "should delete the session" do
      session[:user_id].should_not be_nil
      subject
      session[:user_id].should be_nil
    end

    it "should delete the session token" do
      session[:session_token].should_not be_nil
      subject
      session[:session_token].should be_nil
    end

    it "should display flash success" do
      subject
      expect(flash[:success]).to be_present
    end

    it "should redirect to the home page" do
      subject
      response.should redirect_to root_url
    end
  end
end
