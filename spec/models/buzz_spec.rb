require 'rails_helper'

RSpec.describe Buzz, type: :model do
  before(:each) do
    @user_a = User.create(username: 'apple', fullname: 'Apple Mango')
  end

  context 'Checking Buzz Field validations' do
    it 'returns false if @Buzz.text is not provided' do
      @buzz = Buzz.new(author_id: @user_a.id)
      expect(@buzz.valid?).to be false
    end

    it 'returns true if @buzz.text is provided' do
      @buzz = Buzz.new(author_id: @user_a.id, text: 'This is my first text buzz')
      expect(@buzz.valid?).to be true
    end

    it 'returns false if @buzz.author_id is not provided' do
      @buzz = Buzz.new(text: 'This is my first text buzz')
      expect(@buzz.valid?).to be false
    end

    it 'returns true if @buzz.author_id and @buzz.text are provided' do
      @buzz = Buzz.new(author_id: @user_a.id, text: 'This is my first text buzz')
      expect(@buzz.valid?).to be true
    end
  end

  context 'Checking relationship between User and Buzz' do
    it 'returns @userA as the Buzz author' do
      @buzz = Buzz.new(author_id: @user_a.id, text: 'This is my first text buzz')
      expect(@buzz.author).to eq(@user_a)
    end

    it "returns 2 Buzzs' created by the author @userA" do
      @buzz = Buzz.create(author_id: @user_a.id, text: 'This is my first text buzz')
      @buzz2 = Buzz.create(author_id: @user_a.id, text: 'This is my second text buzz')
      expect(@user_a.buzzs.count).to eq(2)
    end
  end
end
