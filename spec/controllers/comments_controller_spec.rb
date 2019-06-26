require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user) { build(:user, email: 'test@test.com') }
  login_user

  context 'POST #create' do
    let!(:work) { create :work, user: user }
    it 'should update comment info' do
      params = {
        text: 'a'
      }

      post :create, params: { comment: params }
    end
  end
  context 'DELETE #destroy' do
    let!(:work) { build(:work) }
    let!(:comment) { create :comment, user: user, work: work }

    it 'should delete comment' do
      expect { delete :destroy, params: { id: comment.id } }.to change(Comment, :count).by(-1)
    end
  end
end
