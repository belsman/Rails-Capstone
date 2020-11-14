require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Checking User to User Field validations' do
    before(:each) do
        @userA = User.create(username: 'apple', fullname: 'Apple Mango')
    end
    
    it "expects 'User.count' is equal 1" do
        expect(User.count).to eq(1)
    end

    it "expects 'User.count' is equal 1 when a new user with the same 'username' as @userA is created" do
        User.create(username: 'apple', fullname: 'John Doe')
        expect(User.count).to eq(1)
    end

    it "'User.count' is equal 2 when a new user with the different 'username' as @userA is created" do
        User.create(username: 'banana', fullname: 'John Doe')
        expect(User.count).to eq(2)
    end
  end
end
