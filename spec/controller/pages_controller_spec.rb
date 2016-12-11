require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    subject { get :home }

    specify { expect(subject.status).to eq 200 }

    it 'should render home page' do
      expect(subject).to render_template(:home)
    end
  end
end
