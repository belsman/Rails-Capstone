require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before(:each) do
    @user1 = User.create!(username: 'exboybeekay', fullname: 'Bello Babakolo')
    post '/sessions', params: { username: @user1.username }
  end
  
  describe 'POST /create' do
    it 'returns http found' do
      post '/sessions', params: { username: @user1.username }
      expect(response).to have_http_status(:found)
    end
  end

end
