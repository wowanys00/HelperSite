require 'rails_helper'

RSpec.describe WorksController, type: :controller do
  let!(:user) { build(:user, email: 'test@test.com') }

  login_user

  describe 'before actions' do
    describe 'find_work' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:find_work)
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

  context 'GET #show' do
    let!(:work) { create :work, user: user }

    it 'should success and render to edit page' do
      get :show, params: { id: work.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

  context 'GET #edit' do
    let!(:work) { create :work, user: user }

    it 'should success and render to edit page' do
      get :edit, params: { id: work.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end
  context 'PUT #update' do
    let!(:work) { create :work, user: user }

    it 'should update keshback info' do
      params = {
        title: 'a',
        views: '1',
        body: 'c'
      }

      put :update, params: { id: work.id, work: params }
      work.reload
      params.keys.each do |key|
        expect(work.attributes[key.to_s]).to eq params[key]
      end
    end
  end
  context 'POST #create' do
    it 'should update work info' do
      params = {
        title: 'a',
        views: '1',
        body: 'c'
      }
      post :create, params: { work: params }
    end
  end

  context 'DELETE #destroy' do
    let!(:work) { create :work, user: user }

    it 'should delete work' do
      expect { delete :destroy, params: { id: work.id } }.to change(Work, :count).by(-1)
    end
  end
end
