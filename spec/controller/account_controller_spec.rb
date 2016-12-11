require 'rails_helper'

RSpec.describe AccountController, type: :controller do
  describe 'GET #show' do
    let(:user) { FactoryGirl.create :user }

    before(:each) do
      session[:user_id] = user.id
    end

    it 'should return user information hash' do
      hash = { login: 'WinniePooh', name: 'WinnieThePooh' }
      Octokit::Client.any_instance.stub(:user).and_return(hash)

      controller.stub(:user_avatar).and_return('www.github.com/avatars/123')
      controller.stub(:account_link).and_return('www.github.com/winnie')
      res_hash = { user: hash, avatar: "www.github.com/avatars/123", profile_link: "www.github.com/winnie" }
      get :show
      expect(assigns(:account)).to eq res_hash
    end

    it 'should render show page' do
      hash = { login: 'WinniePooh', name: 'WinnieThePooh' }
      Octokit::Client.any_instance.stub(:user).and_return(hash)

      controller.stub(:user_avatar).and_return('www.github.com/avatars/123')
      controller.stub(:account_link).and_return('www.github.com/winnie')
      get :show
      response.should render_template :show 
    end
  end
end
