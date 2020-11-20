require 'rails_helper'

RSpec.describe FollowingsController, type: :controller do
  before(:each) do
    @user = User.create!(username: 'jon', fullname: 'Jon Show')
    @user2 = User.create!(username: 'bello', fullname: 'Bello Babakolo')
  end

  describe 'CREATE following' do
    it 'redirects to user_path' do
      login(@user)
      post :create, params: { user_id: @user2.id }
      expect(response).to redirect_to(user_path(@user2.id))
    end
  end
end
