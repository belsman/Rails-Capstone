require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Checking User to User connections' do
    before(:each) do 
      @userA = User.create(username: 'apple', fullname: 'Apple Mango')
      @userB = User.create(username: 'banana', fullname: 'Banana Guava')
      @userC = User.create(username: 'cashew', fullname: 'Cashew Paw-paw')

      @f1 = @userA.followers.create(follower_id: @userB.id)
      @f2 = @userA.followers.create(follower_id: @userC.id)
    end

    it "return 2 followers for 'userA'" do
      expect(@userA.followers.count).to eq(2)
    end

    it 'returns userB as the first in the follower' do
      expect(@userA.followers.first.follower).to eq(@userB)
    end

    it 'returns the 1 following for @userB' do
      expect(@userB.followed.count).to eq(1)
    end

    it 'returns the userA as the first in userB following list' do
      expect(@userB.followed.first.followed).to eq(@userA)
    end
  end
end
