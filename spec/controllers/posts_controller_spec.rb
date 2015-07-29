require 'rails_helper'

RSpec.describe PostsController, type: :controller do

 

  describe 'GET show' do
    it 'shows requested post' do
      post = FactoryGirl.create(:post)
      get :show, { id: post.to_param}
    end
  end

  describe 'DELETE' do
    it 'destroys requested post' do
        post = FactoryGirl.create(:post)
        expect {
          delete :destroy, { id: post.to_param }
        }.to change(Post, :count).by(-1)
      end
    end


   

end
