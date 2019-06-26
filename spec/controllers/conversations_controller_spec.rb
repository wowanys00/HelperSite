require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
  let!(:user) { build(:user, email: 'test@test.com') }
  login_user
 
  context 'GET #index' do
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end
  
end
