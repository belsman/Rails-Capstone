require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Checking User to User connections' do
    before(:each) do 
      @userA = User.create(username: 'apple', fullname: 'Apple Mango')
      @userB = User.create(username: 'banana', fullname: 'Banana Guava')
      @userC = User.create(username: 'cashew', fullname: 'Cashew Paw-paw')

      @userB.follow(@userA)
      @userC.follow(@userA)
    end

    it "return 2 followers for 'userA'" do
      expect(@userA.followers.count).to eq(2)
    end

    it 'returns userB is following userA' do
      expect(@userB.following?(@userA)).to be true
    end

    it 'returns userA is followed by userC' do
      expect(@userA.followed_by?(@userC)).to be true
    end

    it 'returns the userB unfollows userA' do
      @userB.unfollow(@userA)
      expect(@userB.following?(@userA)).to be false
    end
  end
end
