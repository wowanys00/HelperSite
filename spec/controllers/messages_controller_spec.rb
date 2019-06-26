require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let!(:user) { build(:user, email: 'test@test.com') }

  login_user

  describe 'before actions' do
    describe 'find_conferation' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:find_conferation)
      end
    end
  end

  context 'GET #index' do
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end
end
