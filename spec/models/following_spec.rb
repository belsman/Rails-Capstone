require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Checking User to User connections' do
    before(:each) do
      @user_a = User.create(username: 'apple', fullname: 'Apple Mango')
      @user_b = User.create(username: 'banana', fullname: 'Banana Guava')
      @user_c = User.create(username: 'cashew', fullname: 'Cashew Paw-paw')

      @user_b.follow(@user_a)
      @user_c.follow(@user_a)
    end

    it "return 2 followers for 'userA'" do
      expect(@user_a.followers.count).to eq(2)
    end

    it 'returns userB is following userA' do
      expect(@user_b.following?(@user_a)).to be true
    end

    it 'returns userA is followed by userC' do
      expect(@user_c.followed_by?(@user_c)).to be true
    end

    it 'returns the userB unfollows userA' do
      @user_b.unfollow(@user_a)
      expect(@user_b.following?(@user_a)).to be false
    end
  end
end
