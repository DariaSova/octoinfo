require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe '#authenticate' do

    controller do
      before_action :authenticate
      def new
        render text: 'dummy'
      end
    end

    context "when user is not logged in" do
      it 'should redirect to the home page if user is not logged in' do
        get :new
        expect(subject).to redirect_to root_url
      end
    end

    context "when user is logged in" do
      let(:user) { FactoryGirl.create :user }
      before do
        session[:user_id] = user.id
      end

      it 'should not do anything' do
        get :new
        expect(User.count).to eq 1
        expect(session[:user_id]).to eq user.id
        expect(subject.status).to eq 200
      end

      it 'should return loggedin user' do
        expect(subject.current_user).to eq user
      end
    end
  end

    describe '#not_found' do

      it 'should render custom 404 page' do
        get '/someDummy/url'
        expect(response).to render_template('404')
      end
    end 
end
